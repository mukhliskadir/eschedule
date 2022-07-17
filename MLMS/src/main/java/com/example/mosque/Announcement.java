package com.example.mosque;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Date;

public class Announcement implements Serializable {


	private static final long serialVersionUID = 1L;
	public int id;
	public InputStream picture;
	public String title;
	public String descr;
	public Date date;
	public String time;
	int staffid;
	
	public Announcement() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public InputStream getPicture() {
		return picture;
	}

	public void setPicture(InputStream inputStream) {
		this.picture = inputStream;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getStaffid() {
		return staffid;
	}

	public void setStaffid(int staffid) {
		this.staffid = staffid;
	}
	
	
	
}
