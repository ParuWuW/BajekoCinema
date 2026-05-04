package com.bajekocinema.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.bajekocinema.utils.SessionUtil;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String TERMS_OF_SERVICE = "/termsOfService";
    private static final String PRIVACY_POLICY = "/privacyPolicy";
    private static final String ABOUT_US = "/aboutUs";
    private static final String CONTACT_US = "/contactUs";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
   
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
   
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath(); //URL - URI
       
     
        String path = uri.substring(contextPath.length());


        if (path.startsWith("/resources/") || path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")   || path.startsWith("/WEB-INF")) {

            chain.doFilter(request, response);
            return;
        }

     
        Object user = SessionUtil.getAttribute(req, "UserEmail");
        boolean isLoggedIn = (user != null);

 
        boolean isPublic = path.equals(LOGIN) || path.equals(REGISTER) || path.equals(HOME) || path.equals(TERMS_OF_SERVICE) || path.equals(PRIVACY_POLICY) || path.equals(ABOUT_US) || path.equals(CONTACT_US) ;

        if (!isLoggedIn) {
            if (isPublic) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + LOGIN );
            }
        } else {
        if (isPublic && !path.equals(HOME)) {
           res.sendRedirect(contextPath + "/home");
        } else {
           chain.doFilter(request, response);
        }
           
        }
    }

    @Override
    public void destroy() {}
}
