package com.bajekocinema.controller;

import com.bajekocinema.model.HallAdminModel;
import com.bajekocinema.model.MovieAdminModel;
import com.bajekocinema.model.ShowAdminModel;
import com.bajekocinema.model.TheatreAdminModel;
import com.bajekocinema.services.ShowAdminService;
import com.bajekocinema.services.MovieAdminService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Manages movie shows, including scheduling and theatre assignments.
 *
 * @author bajekocinema
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/shows", "/shows" })
public class ShowsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ShowAdminService  showAdminService  = new ShowAdminService();
    private MovieAdminService movieAdminService = new MovieAdminService();

    public ShowsServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<ShowAdminModel>    shows       = showAdminService.getAllShows();
            List<MovieAdminModel>   movieList   = movieAdminService.getAllMovies();
            List<TheatreAdminModel> theatreList = showAdminService.getAllTheatres();

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

                    List<HallAdminModel> hallList      = showAdminService.getHallsByTheatre(theatreId);
                    List<String>    statusList    = showAdminService.getShowStatuses();
                    MovieAdminModel      chosenMovie   = movieAdminService.getMovieById(movieId);
                    TheatreAdminModel    chosenTheatre = showAdminService.getTheatreById(theatreId);

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
                    ShowAdminModel editShow = showAdminService.getShowByID(showId);

                    if (editShow != null) {
                        List<HallAdminModel> hallList   = showAdminService.getHallsByTheatre(editShow.getTheatreId());
                        List<String>    statusList = showAdminService.getShowStatuses();

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

                showAdminService.scheduleShow(movieId, theatreId, hallId, showDate, startTime, status);

            } catch (Exception e) {
                System.out.println("ShowsServlet: error in schedule action");
                e.printStackTrace();
            }

        } else if ("delete".equals(action)) {
            try {
                int showId = Integer.parseInt(request.getParameter("showID"));
                showAdminService.deleteShow(showId);
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

                showAdminService.updateShow(showId, hallId, showDate, startTime, status);

            } catch (Exception e) {
                System.out.println("ShowsServlet: error in update action");
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/shows");
    }
}