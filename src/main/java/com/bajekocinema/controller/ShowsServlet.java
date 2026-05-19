package com.bajekocinema.controller;

import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.MovieModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.TheatreModel;
import com.bajekocinema.services.ShowService;
import com.bajekocinema.services.MovieService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * ShowsServlet — updated for new bajekocinema-2.sql schema.
 *
 * Schedule Show form fields (new schema):
 *   movieID, theatreID, hallID, showDate, startTime, status
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/shows", "/shows" })
public class ShowsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ShowService  showService  = new ShowService();
    private MovieService movieService = new MovieService();

    public ShowsServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<ShowModel>   shows      = showService.getAllShows();
            List<MovieModel>  movieList  = movieService.getAllMovies();
            List<HallModel>   hallList   = showService.getAllHalls();
            List<TheatreModel>theatreList= showService.getAllTheatres();

            request.setAttribute("shows",       shows);
            request.setAttribute("movieList",   movieList);
            request.setAttribute("hallList",    hallList);
            request.setAttribute("theatreList", theatreList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "shows");
        request.getRequestDispatcher("/WEB-INF/pages/admin/ShowsAdmin.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("schedule".equals(action)) {
            try {
                int    movieId   = Integer.parseInt(request.getParameter("movieID"));
                int    hallId    = Integer.parseInt(request.getParameter("hallID"));
                String showDate  = request.getParameter("showDate");
                String startTime = request.getParameter("startTime");
                String status    = request.getParameter("status");

                // theatreID — use form param if present, otherwise derive from hall
                String theatreParam = request.getParameter("theatreID");
                int theatreId = (theatreParam != null && !theatreParam.isEmpty())
                        ? Integer.parseInt(theatreParam) : 1;

                showService.scheduleShow(movieId, theatreId, hallId, showDate, startTime, status);

            } catch (Exception e) {
                System.out.println("ShowsServlet: error in schedule action");
                e.printStackTrace();
            }
        } else if ("delete".equals(action)) {
            try {
                int showId = Integer.parseInt(request.getParameter("showID"));
                showService.deleteShow(showId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/shows");
    }
}