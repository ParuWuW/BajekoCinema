package com.bajekocinema.model;

public class HallModel {

	private int hallId;
	private int theatreId;
	private String theatreName;
	private String hallName;
	private int totalSeats;

	public int getHallId() {
		return hallId;
	}

	public void setHallId(int hallId) {
		this.hallId = hallId;
	}

	public int getTheatreId() {
		return theatreId;
	}

	public void setTheatreId(int theatreId) {
		this.theatreId = theatreId;
	}

	public String getTheatreName() {
		return theatreName;
	}

	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	// used by JSP pages
	public int getHallID() {
		return hallId;
	}

	public void setHallID(int hallId) {
		this.hallId = hallId;
	}

	public int getHallCapacity() {
		return totalSeats;
	}

	public void setHallCapacity(int capacity) {
		this.totalSeats = capacity;
	}

}