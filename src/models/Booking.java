package models;

public class Booking {
	private int bookingid;
	private int userid;
	private int tourid;
	private int adultnum;
	private int childnum;
	private int totalcost;
	private String bookingdate;
	private String status;
	private String username;
	private String payment;
	
	public int getBookingid() {
		return bookingid;
	}
	public void setBookingid(int bookingid) {
		this.bookingid = bookingid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getTourid() {
		return tourid;
	}
	public void setTourid(int tourid) {
		this.tourid = tourid;
	}
	public int getAdultnum() {
		return adultnum;
	}
	public void setAdultnum(int adultnum) {
		this.adultnum = adultnum;
	}
	public int getChildnum() {
		return childnum;
	}
	public void setChildnum(int childnum) {
		this.childnum = childnum;
	}
	public int getTotalcost() {
		return totalcost;
	}
	public void setTotalcost(int totalcost) {
		this.totalcost = totalcost;
	}
	public String getBookingdate() {
		return bookingdate;
	}
	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}

}
