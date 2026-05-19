package com.bajekocinema.model;

import java.util.Date;

public class ShowModel {
	private int showID;
	private String showTiming;
	private String showDuration;
	private Date showDate;
	private String movieName;
	private String hallName;
	private int movieID;
	private int hallID;
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
		showID = showID;
	}
	/**
	 * @return the showTiming
	 */
	public String getShowTiming() {
		return showTiming;
	}
	/**
	 * @param showTiming the showTiming to set
	 */
	public void setShowTiming(String showTiming) {
		showTiming = showTiming;
	}
	/**
	 * @return the showDuration
	 */
	public String getShowDuration() {
		return showDuration;
	}
	/**
	 * @param showDuration the showDuration to set
	 */
	public void setShowDuration(String showDuration) {
		showDuration = showDuration;
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
		movieName = movieName;
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
		hallName = hallName;
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
		movieID = movieID;
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
		hallID = hallID;
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


}