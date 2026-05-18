package com.bajekocinema.controller;

import com.bajekocinema.model.MovieModel;
import com.bajekocinema.services.MovieService; // CHANGED
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Servlet implementation class MoviesServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/movies"})
public class MoviesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieService movieService = new MovieService(); // CHANGED

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoviesServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<MovieModel> movieList = movieService.getAllMovies(); // CHANGED
            request.setAttribute("movieList", movieList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "movies");
        request.getRequestDispatcher("WEB-INF/pages/admin/MoviesAdmin.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            try {
                MovieModel movie = new MovieModel();
                movie.setMovieName(request.getParameter("movieName"));
                movie.setMovieLanguage(request.getParameter("movieLanguage"));
                movie.setMovieDuration(request.getParameter("movieDuration"));
                movie.setMovieGenre(request.getParameter("movieGenre"));
                movie.setMovieDescription(request.getParameter("movieDescription"));

                String dateStr = request.getParameter("movieReleaseDate");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                movie.setMovieReleaseDate(sdf.parse(dateStr));

                movieService.addMovie(movie); // CHANGED

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if ("delete".equals(action)) {
            try {
                int movieID = Integer.parseInt(request.getParameter("movieID"));
                movieService.deleteMovie(movieID); // CHANGED
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/movies");
    }
}