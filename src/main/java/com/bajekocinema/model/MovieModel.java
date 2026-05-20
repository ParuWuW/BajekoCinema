package com.bajekocinema.model;

import java.util.Date;

public class MovieModel {

	private int movieId;
    private String title;
    private String genre;
    private String description;
    private int durationMin;
    private Date releaseDate;
    private String posterUrl;
    private String trailerUrl;
    private double imdbScore;
    private String status; // 'upcoming', 'now_showing', 'ended'
	/**
	 * @return the movieId
	 */
	public int getMovieId() {
		return movieId;
	}
	/**
	 * @param movieId the movieId to set
	 */
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the genre
	 */
	public String getGenre() {
		return genre;
	}
	/**
	 * @param genre the genre to set
	 */
	public void setGenre(String genre) {
		this.genre = genre;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the durationMin
	 */
	public int getDurationMin() {
		return durationMin;
	}
	/**
	 * @param durationMin the durationMin to set
	 */
	public void setDurationMin(int durationMin) {
		this.durationMin = durationMin;
	}
	/**
	 * @return the releaseDate
	 */
	public Date getReleaseDate() {
		return releaseDate;
	}
	/**
	 * @param releaseDate the releaseDate to set
	 */
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	/**
	 * @return the posterUrl
	 */
	public String getPosterUrl() {
		return posterUrl;
	}
	/**
	 * @param posterUrl the posterUrl to set
	 */
	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}
	/**
	 * @return the trailerUrl
	 */
	public String getTrailerUrl() {
		return trailerUrl;
	}
	/**
	 * @param trailerUrl the trailerUrl to set
	 */
	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}
	/**
	 * @return the imdbScore
	 */
	public double getImdbScore() {
		return imdbScore;
	}
	/**
	 * @param imdbScore the imdbScore to set
	 */
	public void setImdbScore(double imdbScore) {
		this.imdbScore = imdbScore;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
    
	
}