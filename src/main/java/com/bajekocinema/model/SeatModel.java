package com.bajekocinema.model;

public class SeatModel {
	
	private int seatID;
	private int hallID;
	private String hallName;
	private String rowLabel;
	private int seatNumber;
	private boolean isBooked;
	/**
	 * @return the seatID
	 */
	public int getSeatID() {
		return seatID;
	}
	/**
	 * @param seatID the seatID to set
	 */
	public void setSeatID(int seatID) {
		this.seatID = seatID;
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
	 * @return the rowLabel
	 */
	public String getRowLabel() {
		return rowLabel;
	}
	/**
	 * @param rowLabel the rowLabel to set
	 */
	public void setRowLabel(String rowLabel) {
		this.rowLabel = rowLabel;
	}
	/**
	 * @return the seatNumber
	 */
	public int getSeatNumber() {
		return seatNumber;
	}
	/**
	 * @param seatNumber the seatNumber to set
	 */
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
	/**
	 * @return the isBooked
	 */
	public boolean isBooked() {
		return isBooked;
	}
	/**
	 * @param isBooked the isBooked to set
	 */
	public void setBooked(boolean isBooked) {
		this.isBooked = isBooked;
	}
	

}
