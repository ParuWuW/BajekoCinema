package com.bajekocinema.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.model.SessionModel;
import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.SessionService;
import com.bajekocinema.utils.CookieUtil;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
	private final SessionService sessionService = new SessionService();
	private final UserDAO userDAO = new UserDAO();


    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String TERMS_OF_SERVICE = "/termsOfService";
    private static final String PRIVACY_POLICY = "/privacyPolicy";
    private static final String ABOUT_US = "/aboutUs";
    private static final String CONTACT_US = "/contactUs";
    private static final String FAQ = "/Faq";
    private static final String ERROR = "/error";

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

     
     // Validate session via cookie
        SessionModel session = null;
        try {
            Cookie c = CookieUtil.getCookie(req, "SESSION_ID");
            if (c != null) {
                session = sessionService.validateSession(c.getValue());
                if (session != null) {
                    req.setAttribute("loggedInUserId", session.getUser_id());
                    req.setAttribute("loggedInRole",   session.getRole());
                    req.setAttribute("sessionId", session.getSession_id());
                    
                    UserModel user = userDAO.getUserById(session.getUser_id());
                    request.setAttribute("loggedInUser", user);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        boolean isLoggedIn = (session != null);
        boolean isAdmin    = isLoggedIn && "admin".equals(session.getRole());

        // Admin path check
        if (path.startsWith("/admin")) {
            if (!isLoggedIn) {
                res.sendRedirect(contextPath + "/login");
            } else if (!isAdmin) {
                res.sendRedirect(contextPath + "/home"); 
            } else {
                chain.doFilter(request, response);
            }
            return;
        }

 
        boolean isPublic = path.equals(LOGIN) || path.equals(REGISTER) || path.equals(HOME) || path.equals(TERMS_OF_SERVICE) || path.equals(PRIVACY_POLICY) || path.equals(ABOUT_US) || path.equals(CONTACT_US) || path.equals(FAQ) || path.equals(ERROR) ;

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