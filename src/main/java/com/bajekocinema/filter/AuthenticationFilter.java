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
import java.util.Set;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.model.SessionModel;
import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.SessionService;
import com.bajekocinema.utils.CookieUtil;

//@WebFilter("/*")
public class AuthenticationFilter implements Filter {
	private final SessionService sessionService = new SessionService();
	private final UserDAO userDAO = new UserDAO();

	//public pages
    private static final Set<String> PUBLIC_PAGES = Set.of(
            "/home",
            "/termsOfService",
            "/privacyPolicy",
            "/aboutUs",
            "/contactUs",
            "/Faq",
            "/error"
        );
    
    // Only for guests (logged-in users get redirected away)
    private static final Set<String> GUEST_ONLY_PAGES = Set.of(
        "/login",
        "/register"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
   
    }
    
    //define static resources
    private boolean isStaticResource(String path) {
        return path.startsWith("/resources/")
            || path.startsWith("/WEB-INF/")
            || path.endsWith(".css")
            || path.endsWith(".js")
            || path.endsWith(".png")
            || path.endsWith(".jpg")
            || path.endsWith(".ico");
    }
    
    
    //FILTER WORK
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
   
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath(); //URL - URI
        String path = uri.substring(contextPath.length());

        // 1. Always pass static assets straight through
        if (isStaticResource(path)) {
            chain.doFilter(request, response);
            return;
        }
  
        // 2. Validate session via cookie
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

        //3. Admin path check
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

 
        //4. Guest_only pages
        if (GUEST_ONLY_PAGES.contains(path)) {
            if (isLoggedIn) {
                res.sendRedirect(contextPath + "/home");   // already logged in
            } else {
                chain.doFilter(request, response);         // guest — allow
            }
            return;
        }
        
        // 5. Public pages (accessible to everyone)
        if (PUBLIC_PAGES.contains(path)) {
            chain.doFilter(request, response);
            return;
        }
        
        // 6. Everything else is protected
        if (!isLoggedIn) {
            res.sendRedirect(contextPath + "/login");
        } else {
            chain.doFilter(request, response);             // authenticated — allow
        }
    }

    @Override
    public void destroy() {}
}