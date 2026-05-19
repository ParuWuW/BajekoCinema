package com.bajekocinema.model;

public class ShowModel {

	private int showId;
	private int movieId;
	private int theatreId;
	private int hallId;
	private String showDate;
	private String startTime;
	private String status;

	// joined fields for display
	private String movieTitle;
	private String hallName;
	private String theatreName;

	public int getShowId() {
		return showId;
	}

	public void setShowId(int showId) {
		this.showId = showId;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public int getTheatreId() {
		return theatreId;
	}

	public void setTheatreId(int theatreId) {
		this.theatreId = theatreId;
	}

	public int getHallId() {
		return hallId;
	}

	public void setHallId(int hallId) {
		this.hallId = hallId;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public String getTheatreName() {
		return theatreName;
	}

	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
	}

	// used by admin JSP pages
	public int getShowID() {
		return showId;
	}

	public void setShowID(int showId) {
		this.showId = showId;
	}

	public int getMovieID() {
		return movieId;
	}

	public void setMovieID(int movieId) {
		this.movieId = movieId;
	}

	public int getHallID() {
		return hallId;
	}

	public void setHallID(int hallId) {
		this.hallId = hallId;
	}

	public String getMovieName() {
		return movieTitle;
	}

	public void setMovieName(String movieName) {
		this.movieTitle = movieName;
	}

	public String getShowTiming() {
		if (showDate != null && startTime != null) {
			return showDate + " " + startTime;
		}
		if (showDate != null) {
			return showDate;
		}
		if (startTime != null) {
			return startTime;
		}
		return "";
	}

	public void setShowTiming(String showTiming) {
		this.startTime = showTiming;
	}

	public String getShowDuration() {
		return status != null ? status : "";
	}

	public void setShowDuration(String showDuration) {
		// no duration field in new schema
	}

}