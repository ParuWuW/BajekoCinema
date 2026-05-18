package com.bajekocinema.model;

public class SeatModel {

    private int    seatId;
    private int    hallId;
    private String rowLabel;
    private int    seatNumber;
    private String seatStatus; // "available" | "booked"  (set by SeatDAO, not a DB column)

    public SeatModel() {}

    public int    getSeatId()     { return seatId; }
    public void   setSeatId(int seatId)           { this.seatId = seatId; }

    public int    getHallId()     { return hallId; }
    public void   setHallId(int hallId)           { this.hallId = hallId; }

    public String getRowLabel()   { return rowLabel; }
    public void   setRowLabel(String rowLabel)     { this.rowLabel = rowLabel; }

    public int    getSeatNumber() { return seatNumber; }
    public void   setSeatNumber(int seatNumber)   { this.seatNumber = seatNumber; }

    public String getSeatStatus() { return seatStatus; }
    public void   setSeatStatus(String seatStatus){ this.seatStatus = seatStatus; }
}