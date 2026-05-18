package com.bajekocinema.controller;

import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.MovieModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.services.ShowService; // CHANGED
import com.bajekocinema.services.MovieService; // CHANGED
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ShowsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/shows" })
public class ShowsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ShowService showService = new ShowService(); // CHANGED
    private MovieService movieService = new MovieService(); // CHANGED

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ShowModel> shows = showService.getAllShows(); // CHANGED
            List<MovieModel> movieList = movieService.getAllMovies(); // CHANGED
            List<HallModel> hallList = showService.getAllHalls(); // CHANGED

            request.setAttribute("shows", shows);
            request.setAttribute("movieList", movieList);
            request.setAttribute("hallList", hallList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "shows");
        request.getRequestDispatcher("WEB-INF/pages/admin/ShowsAdmin.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("schedule".equals(action)) {
            try {
                String showTiming = request.getParameter("showTiming");
                String showDuration = request.getParameter("showDuration");
                int movieID = Integer.parseInt(request.getParameter("movieID"));
                int hallID = Integer.parseInt(request.getParameter("hallID"));

                showService.scheduleShow(showTiming, showDuration, movieID, hallID); // CHANGED
            } catch (Exception e) {
                System.out.println("Error in schedule action");
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/shows");
    }
}