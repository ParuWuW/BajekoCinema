package com.bajekocinema.model;

import java.util.Date;

public class MovieModel {

    private int MovieID;
    private String MovieName;
    private String MovieLanguage;
    private Date MovieReleaseDate;
    private String MovieDuration;
    private String MovieGenre;
    private String MovieDescription;

    /**
     * @return the movieID
     */
    public int getMovieID() { return MovieID; }
    /**
     * @param movieID the movieID to set
     */
    public void setMovieID(int movieID) { MovieID = movieID; }

    /**
     * @return the movieName
     */
    public String getMovieName() { return MovieName; }
    /**
     * @param movieName the movieName to set
     */
    public void setMovieName(String movieName) { MovieName = movieName; }

    /**
     * @return the movieLanguage
     */
    public String getMovieLanguage() { return MovieLanguage; }
    /**
     * @param movieLanguage the movieLanguage to set
     */
    public void setMovieLanguage(String movieLanguage) { MovieLanguage = movieLanguage; }

    /**
     * @return the movieReleaseDate
     */
    public Date getMovieReleaseDate() { return MovieReleaseDate; }
    /**
     * @param movieReleaseDate the movieReleaseDate to set
     */
    public void setMovieReleaseDate(Date movieReleaseDate) { MovieReleaseDate = movieReleaseDate; }

    /**
     * @return the movieDuration
     */
    public String getMovieDuration() { return MovieDuration; }
    /**
     * @param movieDuration the movieDuration to set
     */
    public void setMovieDuration(String movieDuration) { MovieDuration = movieDuration; }

    /**
     * @return the movieGenre
     */
    public String getMovieGenre() { return MovieGenre; }
    /**
     * @param movieGenre the movieGenre to set
     */
    public void setMovieGenre(String movieGenre) { MovieGenre = movieGenre; }

    /**
     * @return the movieDescription
     */
    public String getMovieDescription() { return MovieDescription; }
    /**
     * @param movieDescription the movieDescription to set
     */
    public void setMovieDescription(String movieDescription) { MovieDescription = movieDescription; }
}