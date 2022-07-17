package com.example.mosque;

import java.io.InputStream;
import java.io.Serializable;

public class Staff implements Serializable {


    private static final long serialVersionUID = 1L;
    public int id;
    public String staffName;
    public String staffPhone;
    public String  staffUsername;
    public String staffPassword;
    public String staffRole;
    public InputStream staffpicture;
    public int svid;
    
    public Staff() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffPhone() {
		return staffPhone;
	}

	public void setStaffPhone(String staffPhone) {
		this.staffPhone = staffPhone;
	}

	public String getStaffUsername() {
		return staffUsername;
	}

	public void setStaffUsername(String staffUsername) {
		this.staffUsername = staffUsername;
	}

	public String getStaffPassword() {
		return staffPassword;
	}

	public void setStaffPassword(String staffPassword) {
		this.staffPassword = staffPassword;
	}

	public String getStaffRole() {
		return staffRole;
	}

	public void setStaffRole(String staffRole) {
		this.staffRole = staffRole;
	}

	public InputStream getStaffpicture() {
		return staffpicture;
	}

	public void setStaffpicture(InputStream staffpicture) {
		this.staffpicture = staffpicture;
	}

	public int getSvid() {
		return svid;
	}

	public void setSvid(int svid) {
		this.svid = svid;
	}
    
    

}
