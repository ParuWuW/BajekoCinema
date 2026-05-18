package com.bajekocinema.model;

import java.util.Date;

public class ShowModel {

    private int showID;
    private String showTiming;
    private String showDuration;
    private int movieID;
    private String movieName;
    private int hallID;
    private String hallName;
    private Date showDate;
    private Date startTime;
    private String status;

    // ---- showID ----
    public int getShowID()            { return showID; }
    public void setShowID(int id)     { this.showID = id; }
    public int getShowId()            { return showID; }
    public void setShowId(int id)     { this.showID = id; }

    // ---- showTiming (raw string kept for admin views) ----
    public String getShowTiming()              { return showTiming; }
    public void   setShowTiming(String t)      { this.showTiming = t; }

    // ---- showDuration ----
    public String getShowDuration()            { return showDuration; }
    public void   setShowDuration(String d)    { this.showDuration = d; }

    // ---- movieID ----
    public int  getMovieID()          { return movieID; }
    public void setMovieID(int id)    { this.movieID = id; }
    public int  getMovieId()          { return movieID; }
    public void setMovieId(int id)    { this.movieID = id; }

    // ---- movieName ----
    public String getMovieName()              { return movieName; }
    public void   setMovieName(String name)   { this.movieName = name; }

    // ---- hallID ----
    public int  getHallID()           { return hallID; }
    public void setHallID(int id)     { this.hallID = id; }
    public int  getHallId()           { return hallID; }
    public void setHallId(int id)     { this.hallID = id; }

    // ---- hallName ----
    public String getHallName()               { return hallName; }
    public void   setHallName(String name)    { this.hallName = name; }

    // ---- showDate (date part of ShowTiming — used by fmt:formatDate in JSP) ----
    public Date getShowDate()             { return showDate; }
    public void setShowDate(Date d)       { this.showDate = d; }

    // ---- startTime (time part of ShowTiming — used by fmt:formatDate in JSP) ----
    public Date getStartTime()            { return startTime; }
    public void setStartTime(Date t)      { this.startTime = t; }

    // ---- status ("scheduled" | "cancelled") ----
    public String getStatus()             { return status; }
    public void   setStatus(String s)     { this.status = s; }
}
