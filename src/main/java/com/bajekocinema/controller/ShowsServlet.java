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
            List<ShowModel>    shows       = showService.getAllShows();
            List<MovieModel>   movieList   = movieService.getAllMovies();
            List<TheatreModel> theatreList = showService.getAllTheatres();

            request.setAttribute("shows",       shows);
            request.setAttribute("movieList",   movieList);
            request.setAttribute("theatreList", theatreList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String form = request.getParameter("form");

        if ("pick".equals(form)) {
            request.setAttribute("showPickForm", true);
        }

        else if ("schedule".equals(form)) {
            String movieIdStr   = request.getParameter("movieID");
            String theatreIdStr = request.getParameter("theatreID");

            if (movieIdStr != null && !movieIdStr.isEmpty()
                    && theatreIdStr != null && !theatreIdStr.isEmpty()) {
                try {
                    int movieId   = Integer.parseInt(movieIdStr);
                    int theatreId = Integer.parseInt(theatreIdStr);

                    List<HallModel> hallList      = showService.getHallsByTheatre(theatreId);
                    List<String>    statusList    = showService.getShowStatuses();
                    MovieModel      chosenMovie   = movieService.getMovieById(movieId);
                    TheatreModel    chosenTheatre = showService.getTheatreById(theatreId);

                    request.setAttribute("hallList",          hallList);
                    request.setAttribute("statusList",        statusList);
                    request.setAttribute("chosenMovie",       chosenMovie);
                    request.setAttribute("chosenTheatre",     chosenTheatre);
                    request.setAttribute("selectedMovieId",   movieIdStr);
                    request.setAttribute("selectedTheatreId", theatreIdStr);
                    request.setAttribute("showScheduleForm",  true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("showPickForm", true);
            }
        }

        else if ("edit".equals(form)) {
            String showIdStr = request.getParameter("showID");
            if (showIdStr != null && !showIdStr.isEmpty()) {
                try {
                    int       showId   = Integer.parseInt(showIdStr);
                    ShowModel editShow = showService.getShowByID(showId);

                    if (editShow != null) {
                        List<HallModel> hallList   = showService.getHallsByTheatre(editShow.getTheatreId());
                        List<String>    statusList = showService.getShowStatuses();

                        request.setAttribute("editShow",     editShow);
                        request.setAttribute("hallList",     hallList);
                        request.setAttribute("statusList",   statusList);
                        request.setAttribute("showEditForm", true);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
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
                int    theatreId = Integer.parseInt(request.getParameter("theatreID"));
                int    hallId    = Integer.parseInt(request.getParameter("hallID"));
                String showDate  = request.getParameter("showDate");
                String startTime = request.getParameter("startTime");
                String status    = request.getParameter("status");

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

        } else if ("update".equals(action)) {
            try {
                int    showId    = Integer.parseInt(request.getParameter("showID"));
                int    hallId    = Integer.parseInt(request.getParameter("hallID"));
                String showDate  = request.getParameter("showDate");
                String startTime = request.getParameter("startTime");
                String status    = request.getParameter("status");

                showService.updateShow(showId, hallId, showDate, startTime, status);

            } catch (Exception e) {
                System.out.println("ShowsServlet: error in update action");
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/shows");
    }
}