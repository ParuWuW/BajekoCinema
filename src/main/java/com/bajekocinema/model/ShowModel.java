package com.bajekocinema.model;

import java.sql.Time;
import java.util.Date;

public class ShowModel {
    private int showID;
    private int movieID;
    private int theatreID;
    private int hallID;
    private Date showDate;
    private Time startTime;
    private String status;
    
    // joined fields for display
    private String movieName;
    private String hallName;
    private String theatreName;
    
    
	/**
	 * @return the showID
	 */
	public int getShowID() {
		return showID;
	}
	/**
	 * @param showID the showID to set
	 */
	public void setShowID(int showID) {
		this.showID = showID;
	}
	/**
	 * @return the movieID
	 */
	public int getMovieID() {
		return movieID;
	}
	/**
	 * @param movieID the movieID to set
	 */
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	/**
	 * @return the theatreID
	 */
	public int getTheatreID() {
		return theatreID;
	}
	/**
	 * @param theatreID the theatreID to set
	 */
	public void setTheatreID(int theatreID) {
		this.theatreID = theatreID;
	}
	/**
	 * @return the hallID
	 */
	public int getHallID() {
		return hallID;
	}
	/**
	 * @param hallID the hallID to set
	 */
	public void setHallID(int hallID) {
		this.hallID = hallID;
	}
	/**
	 * @return the showDate
	 */
	public Date getShowDate() {
		return showDate;
	}
	/**
	 * @param showDate the showDate to set
	 */
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	/**
	 * @return the startTime
	 */
	public Time getStartTime() {
		return startTime;
	}
	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
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
	/**
	 * @return the movieName
	 */
	public String getMovieName() {
		return movieName;
	}
	/**
	 * @param movieName the movieName to set
	 */
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	/**
	 * @return the hallName
	 */
	public String getHallName() {
		return hallName;
	}
	/**
	 * @param hallName the hallName to set
	 */
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	/**
	 * @return the theatreName
	 */
	public String getTheatreName() {
		return theatreName;
	}
	/**
	 * @param theatreName the theatreName to set
	 */
	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
	}


}