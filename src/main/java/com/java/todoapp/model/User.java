package com.java.todoapp.model;

import java.io.Serializable;

public class User implements Serializable {
	
	private static final long serialVersionUID = 1;
	private String firstName;
	private String lastName;
	private String username;
	private String password;
	
	public String getFristName()  {
		return firstName;
	}
	
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getUserName() {
		return username;
	}
	
	public void setUserName(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}
