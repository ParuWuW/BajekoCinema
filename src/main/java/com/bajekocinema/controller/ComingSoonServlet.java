package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.bajekocinema.model.GenreModel;
import com.bajekocinema.model.MovieModel;
import com.bajekocinema.services.MovieService;

/**
 * Servlet implementation class ComingSoonServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/comingSoon" })
public class ComingSoonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieService movieService = new MovieService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComingSoonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        String genreParam = request.getParameter("genre");

        List<GenreModel> genres           = movieService.getAllGenres();
        List<MovieModel> comingSoonMovies = movieService.getUpcomingMovies(genreParam);

        request.setAttribute("genres", genres);
        request.setAttribute("comingSoonMovies", comingSoonMovies);
        request.setAttribute("selectedGenre", genreParam);
        
        request.getRequestDispatcher("WEB-INF/pages/public/ComingSoon.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
