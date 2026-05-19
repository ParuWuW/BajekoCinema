package com.bajekocinema.model;

import java.sql.Date;
import java.sql.Time;

public class ShowModel {
	private int showID;
	private int movieID;
	private int theatreID;
	private int hallID;
	private Date showDate;
	private Time startTime;
	private String status;
	
	public int getShowID() {
		return showID;
	}
	public void setShowID(int showID) {
		this.showID = showID;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public int getTheatreID() {
		return theatreID;
	}
	public void setTheatreID(int theatreID) {
		this.theatreID = theatreID;
	}
	public int getHallID() {
		return hallID;
	}
	public void setHallID(int hallID) {
		this.hallID = hallID;
	}
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


}