package cn.springmvc.model;

public class People {

	private String name;
	 private String phone;
	 private int id;
	 private String authority;
	 
	 public String getAuthority() {
		return authority;
	}
	 public void setAuthority(String authority) {
		this.authority = authority;
	}
	 
	 
	 
	 public People(String name,  String phone, int id, String authority) {
		super();
		this.name = name;
		this.phone = phone;
		this.id = id;
		this.authority = authority;
	}
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

}
