package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

import com.bajekocinema.model.MovieModel;
import com.bajekocinema.services.MovieService;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/home" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieService movieService = new MovieService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String searchQuery = request.getParameter("search");

        List<MovieModel> nowShowingMovies;
        List<MovieModel> comingSoonMovies;

        if (searchQuery == null) {
            // No search performed — default home page
            nowShowingMovies = movieService.getNowShowingMovies();
            comingSoonMovies = movieService.getUpcomingMovies();
            request.setAttribute("searchState", "none");

        } else if (searchQuery.trim().isEmpty()) {
            // User submitted empty search — show message, hide movie sections
            nowShowingMovies = Collections.emptyList();
            comingSoonMovies = Collections.emptyList();
            request.setAttribute("searchState", "empty");
            request.setAttribute("searchMessage", "Please enter a search term");

        } else {
            // Search performed with a term — filter both sections
            String trimmed = searchQuery.trim();
            nowShowingMovies = movieService.searchNowShowingMovies(trimmed);
            comingSoonMovies = movieService.searchUpcomingMovies(trimmed);
            request.setAttribute("searchState", "results");
            request.setAttribute("searchQuery", trimmed);
        }

        request.setAttribute("nowShowingMovies", nowShowingMovies);
        request.setAttribute("comingSoonMovies", comingSoonMovies);
		request.getRequestDispatcher("WEB-INF/pages/public/Home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
