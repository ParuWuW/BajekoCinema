package com.bajekocinema.controller;

import com.bajekocinema.model.MovieModel;
import com.bajekocinema.services.MovieService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;

@MultipartConfig(maxFileSize = 50 * 1024 * 1024)
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/movies" })
public class MoviesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MovieService movieService = new MovieService();

    public MoviesServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<MovieModel> movieList  = movieService.getAllMovies();
            List<String>     statusList = movieService.getMovieStatuses();
            List<String>     genreList  = movieService.getAllGenreNames();

            request.setAttribute("movieList",  movieList);
            request.setAttribute("statusList", statusList);
            request.setAttribute("genreList",  genreList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // which form panel to show — driven by GET param, no JS needed
        String form = request.getParameter("form");
        if ("add".equals(form)) {
            request.setAttribute("showAddForm", true);
        } else if ("genre".equals(form)) {
            request.setAttribute("showGenreForm", true);
        }

        // edit form — load movie from DB so JSP can pre-fill server-side
        String editIdStr = request.getParameter("editMovieID");
        if (editIdStr != null && !editIdStr.isEmpty()) {
            try {
                int editId = Integer.parseInt(editIdStr);
                MovieModel editMovie = movieService.getMovieById(editId);
                if (editMovie != null) {
                    request.setAttribute("editMovie",     editMovie);
                    request.setAttribute("showEditForm",  true);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("currentPage", "movies");
        request.getRequestDispatcher("/WEB-INF/pages/admin/MoviesAdmin.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            try {
                MovieModel movie = new MovieModel();
                movie.setTitle(request.getParameter("movieName"));
                movie.setGenre(request.getParameter("movieGenre"));
                movie.setDescription(request.getParameter("movieDescription"));
                movie.setDurationMin(Integer.parseInt(request.getParameter("movieDuration")));
                movie.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("movieReleaseDate")));
                movie.setImdbScore(Double.parseDouble(request.getParameter("imdbScore")));
                movie.setStatus(request.getParameter("movieStatus"));

                String posterPath = handleFileUpload(request.getPart("posterFile"), "images/posters");
                movie.setPosterUrl(posterPath != null ? posterPath : "");

                String trailerPath = handleFileUpload(request.getPart("trailerFile"), "videos");
                movie.setTrailerUrl(trailerPath != null ? trailerPath : "");

                movieService.addMovie(movie);

            } catch (Exception e) {
                System.out.println("MoviesServlet: error in add action");
                e.printStackTrace();
            }

        } else if ("edit".equals(action)) {
            try {
                MovieModel movie = new MovieModel();
                movie.setMovieId(Integer.parseInt(request.getParameter("editMovieID")));
                movie.setTitle(request.getParameter("editMovieName"));
                movie.setGenre(request.getParameter("editMovieGenre"));
                movie.setDescription(request.getParameter("editMovieDescription"));
                movie.setDurationMin(Integer.parseInt(request.getParameter("editMovieDuration")));
                movie.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("editMovieReleaseDate")));
                movie.setImdbScore(Double.parseDouble(request.getParameter("editImdbScore")));
                movie.setStatus(request.getParameter("editMovieStatus"));

                String posterPath = handleFileUpload(request.getPart("editPosterFile"), "images/posters");
                movie.setPosterUrl(posterPath != null ? posterPath : "");

                String trailerPath = handleFileUpload(request.getPart("editTrailerFile"), "videos");
                movie.setTrailerUrl(trailerPath != null ? trailerPath : "");

                movieService.updateMovie(movie);

            } catch (Exception e) {
                System.out.println("MoviesServlet: error in edit action");
                e.printStackTrace();
            }

        } else if ("delete".equals(action)) {
            try {
                int movieID = Integer.parseInt(request.getParameter("movieID"));
                movieService.deleteMovie(movieID);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if ("add_genre".equals(action)) {
            try {
                String genreName = request.getParameter("genreName");
                if (genreName != null && !genreName.trim().isEmpty()) {
                    movieService.addGenre(genreName.trim());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/movies");
    }

    private String handleFileUpload(Part part, String subDir) {

        if (part == null || part.getSize() == 0) {
            return null;
        }

        try {
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (fileName == null || fileName.isEmpty()) {
                return null;
            }

            String uniqueName = System.currentTimeMillis() + "_" + fileName;
            String uploadDir  = getServletContext().getRealPath("/resources/" + subDir);

            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            try (InputStream is = part.getInputStream()) {
                Files.copy(is, new File(uploadDir + File.separator + uniqueName).toPath(),
                        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }

            return "resources/" + subDir + "/" + uniqueName;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}