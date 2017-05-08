package adapters;

import java.sql.ResultSet;
import java.util.ArrayList;

import models.Booking;

public class BookingAdapter {
	
	public void insert(Booking bk)
	{
		//int totalbooked=bk.getAdultnum()+bk.getChildnum();
		String sql = "INSERT INTO booking VALUES (null ,"+bk.getUserid()+",'"+bk.getUsername()+"', "+bk.getTourid()+", "+bk.getAdultnum()+", "+bk.getChildnum()+","+bk.getTotalcost()+",'"+bk.getBookingdate()+"','pending','unpaid')";
		//String sql1="UPDATE tourpackages  SET totalbooked = totalbooked+"+totalbooked+",totalchildbooked=totalchildbooked+"+bk.getChildnum()+" WHERE tourid ="+bk.getTourid();
		
		DataAccess da = new DataAccess();
		da.executeQuery(sql);
		//da.executeQuery(sql1);
		//System.out.println(sql1);
	}
	
	public ArrayList<Booking> getUnpaidBookingList(int userid)
	{
		String sql="SELECT * FROM booking WHERE status='unpaid' and userid="+userid;
		DataAccess da=new DataAccess();
		ResultSet rs= da.getResultSet(sql);
		ArrayList<Booking> booking=new ArrayList<Booking>();
		try {
			while(rs.next())
			{
				Booking bk=new Booking();
				bk.setBookingid(rs.getInt("bookingid"));
				bk.setUserid(rs.getInt("userid"));
				bk.setTourid(rs.getInt("tourid"));
				bk.setAdultnum(rs.getInt("adultnum"));
				bk.setChildnum(rs.getInt("childnum"));
				bk.setTotalcost(rs.getInt("totalcost"));
				bk.setBookingdate(rs.getString("bookingdate"));
				bk.setStatus(rs.getString("status"));
				bk.setPayment(rs.getString("payment"));
				bk.setUsername(rs.getString("username"));
				booking.add(bk);
			}
			return booking;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Booking> getPaidBookingList(int userid)
	{
		String sql="SELECT * FROM booking WHERE payment='paid' and userid="+userid;
		DataAccess da=new DataAccess();
		ResultSet rs= da.getResultSet(sql);
		ArrayList<Booking> booking=new ArrayList<Booking>();
		try {
			while(rs.next())
			{
				Booking bk=new Booking();
				bk.setBookingid(rs.getInt("bookingid"));
				bk.setUserid(rs.getInt("userid"));
				bk.setTourid(rs.getInt("tourid"));
				bk.setAdultnum(rs.getInt("adultnum"));
				bk.setChildnum(rs.getInt("childnum"));
				bk.setTotalcost(rs.getInt("totalcost"));
				bk.setBookingdate(rs.getString("bookingdate"));
				bk.setStatus(rs.getString("status"));
				bk.setPayment(rs.getString("payment"));
				bk.setUsername(rs.getString("username"));
				booking.add(bk);
			}
			return booking;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<Booking> getBookinglist(int tourid)
	{
		String sql="SELECT * FROM booking WHERE tourid="+tourid;
		DataAccess da=new DataAccess();
		ResultSet rs= da.getResultSet(sql);
		ArrayList<Booking> booking=new ArrayList<Booking>();
		try {
			while(rs.next())
			{
				Booking bk=new Booking();
				bk.setBookingid(rs.getInt("bookingid"));
				bk.setUserid(rs.getInt("userid"));
				bk.setTourid(rs.getInt("tourid"));
				bk.setAdultnum(rs.getInt("adultnum"));
				bk.setChildnum(rs.getInt("childnum"));
				bk.setTotalcost(rs.getInt("totalcost"));
				bk.setBookingdate(rs.getString("bookingdate"));
				bk.setStatus(rs.getString("status"));
				bk.setPayment(rs.getString("payment"));
				bk.setUsername(rs.getString("username"));
				booking.add(bk);
			}
			return booking;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void ConfirmTour(int bookingid) {
		int tb=0;
		int an=0;
		int cn=0;
		int tourid=0;
		DataAccess da=new DataAccess();
		String sql2="select * from booking where status!='confirmed' and bookingid="+bookingid;
		ResultSet rs=da.getResultSet(sql2);
		try {
			if(rs.next()){
				an=rs.getInt("adultnum");
				cn=rs.getInt("childnum");
				tb=an+cn;
				tourid=rs.getInt("tourid");
				String sql1="UPDATE tourpackages  SET totalbooked = totalbooked+"+tb+",totalchildbooked=totalchildbooked+"+cn+" WHERE tourid ="+tourid;
				da.executeQuery(sql1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String sql="UPDATE booking SET payment = 'paid',status = 'confirmed' WHERE bookingid ="+bookingid;
		da.executeQuery(sql);
		
	}
	
	public void CancleBooking(int bookingid) {
		int tb=0;
		int an=0;
		int cn=0;
		int tourid=0;
		DataAccess da=new DataAccess();
		String sql2="select * from booking where status='confirmed' and bookingid="+bookingid;
		ResultSet rs=da.getResultSet(sql2);
		try {
			if(rs.next()){
				an=rs.getInt("adultnum");
				cn=rs.getInt("childnum");
				tb=an+cn;
				tourid=rs.getInt("tourid");
				String sql1="UPDATE tourpackages  SET totalbooked = totalbooked-"+tb+",totalchildbooked=totalchildbooked-"+cn+" WHERE tourid ="+tourid;
				da.executeQuery(sql1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		String sql="UPDATE booking SET status = 'canceled' WHERE bookingid ="+bookingid;
		//String sql1="UPDATE tourpackages  SET totalbooked = totalbooked+"+tb+",totalchildbooked=totalchildbooked+"+cn+" WHERE tourid ="+tourid;
		da.executeQuery(sql);
		
	}

	public void cancelTour(int tourid){
		String sql="UPDATE booking SET status = 'canceled' WHERE tourid ="+tourid;
		DataAccess da = new DataAccess();
		da.executeQuery(sql);
	}
	public void regularTour(int tourid) {
		String sql="UPDATE booking SET status = 'pending' WHERE tourid ="+tourid;
		DataAccess da = new DataAccess();
		da.executeQuery(sql);
	}
}
