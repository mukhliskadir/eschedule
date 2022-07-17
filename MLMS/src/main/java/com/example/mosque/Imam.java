package com.example.mosque;

import java.io.Serializable;

public class Imam extends Staff {


    private static final long serialVersionUID = 1L;
    public int id;
    public String education;
    
    public Imam() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
    
}
