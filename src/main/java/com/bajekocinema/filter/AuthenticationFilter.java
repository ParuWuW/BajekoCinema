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

@WebFilter(asyncSupported = true, urlPatterns = {"/login", "/register"})
public class AuthenticationFilter extends HttpFilter implements Filter {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
    public void init(FilterConfig filterConfig) throws ServletException {
   
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
   
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        SessionModel user = (session == null) ? null : (SessionModel) session.getAttribute("session");

        if (user != null) {
            res.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        chain.doFilter(request, response);
        return;
    }


    @Override
    public void destroy() {}
}
