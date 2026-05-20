package com.bajekocinema.model;

import java.util.Date;

public class MovieAdminModel {

	private int movieId;
	private String title;
	private String genre;
	private String description;
	private int durationMin;
	private Date releaseDate;
	private String posterUrl;
	private String trailerUrl;
	private double imdbScore;
	private String status;

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDurationMin() {
		return durationMin;
	}

	public void setDurationMin(int durationMin) {
		this.durationMin = durationMin;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getPosterUrl() {
		return posterUrl;
	}

	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public double getImdbScore() {
		return imdbScore;
	}

	public void setImdbScore(double imdbScore) {
		this.imdbScore = imdbScore;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMovieID() {
		return movieId;
	}

	public String getMovieName() {
		return title;
	}

	public String getMovieGenre() {
		return genre;
	}

	public String getMovieDescription() {
		return description;
	}

	public String getMovieDuration() {
		return durationMin + " min";
	}

	public Date getMovieReleaseDate() {
		return releaseDate;
	}

	public String getMovieLanguage() {
		return "";
	}
}