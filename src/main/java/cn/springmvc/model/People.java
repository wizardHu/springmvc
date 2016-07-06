package cn.springmvc.model;

import java.sql.Date;

 
public class People {

	private String name;
	 private int count;
	 private String phone;
	 private int id;
	 
	 public int getId() {
		return id;
	}
	 public void setId(int id) {
		this.id = id;
	}
	 
	 public People() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public People(String name, int count, String phone) {
		super();
		this.name = name;
		this.count = count;
		this.phone = phone;
	}
	public People(String name, int count, String phone, int id) {
		super();
		this.name = name;
		this.count = count;
		this.phone = phone;
		this.id = id;
	}

	
}
