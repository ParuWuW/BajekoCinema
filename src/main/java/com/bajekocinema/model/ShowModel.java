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

    // joined fields for display
    private String movieName;
    private String hallName;
    private String theatreName;

    // ---- kept for legacy admin code that still references them ----
    private String showTiming;
    private String showDuration;

    public int getShowID() { return showID; }
    public void setShowID(int showID) { this.showID = showID; }

    public int getMovieID() { return movieID; }
    public void setMovieID(int movieID) { this.movieID = movieID; }

    public int getTheatreID() { return theatreID; }
    public void setTheatreID(int theatreID) { this.theatreID = theatreID; }

    public int getHallID() { return hallID; }
    public void setHallID(int hallID) { this.hallID = hallID; }

    public Date getShowDate() { return showDate; }
    public void setShowDate(Date showDate) { this.showDate = showDate; }

    public Time getStartTime() { return startTime; }
    public void setStartTime(Time startTime) { this.startTime = startTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getMovieName() { return movieName; }
    public void setMovieName(String movieName) { this.movieName = movieName; }

    public String getHallName() { return hallName; }
    public void setHallName(String hallName) { this.hallName = hallName; }

    public String getTheatreName() { return theatreName; }
    public void setTheatreName(String theatreName) { this.theatreName = theatreName; }

    public String getShowTiming() { return showTiming; }
    public void setShowTiming(String showTiming) { this.showTiming = showTiming; }

    public String getShowDuration() { return showDuration; }
    public void setShowDuration(String showDuration) { this.showDuration = showDuration; }
}