package com.bajekocinema.model;

public class HallModel {
	private int hallID;
	private int theatreID;
	private String hallName;
	private int hallCapacity;
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
	 * @return the hallCapacity
	 */
	public int getHallCapacity() {
		return hallCapacity;
	}
	/**
	 * @param hallCapacity the hallCapacity to set
	 */
	public void setHallCapacity(int hallCapacity) {
		this.hallCapacity = hallCapacity;
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

}