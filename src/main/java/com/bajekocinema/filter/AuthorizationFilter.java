package com.bajekocinema.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.bajekocinema.model.SessionModel;

/**
 * Servlet Filter implementation class AuthorizationFilter
 */
@WebFilter(asyncSupported = true, urlPatterns = {
	    "/profile",
	    "/booking", 
	    "/userProfile",
	    "/reviewBooking",
	    "/admin/*" }
	)
public class AuthorizationFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
	
        HttpSession session = req.getSession(false);
        SessionModel user = (session == null) ? null : (SessionModel) session.getAttribute("session");
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Admin: must be logged in AND be an admin
        if (uri.startsWith(contextPath + "/admin")) {
            if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
                res.sendRedirect(contextPath + "/home");
                return;
            }
        }

        // Protected pages: must be logged in
        if (user == null) {
            res.sendRedirect(contextPath + "/login");
            return;
        }

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}
	
	/**
     * @see HttpFilter#HttpFilter()
     */
    public AuthorizationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
