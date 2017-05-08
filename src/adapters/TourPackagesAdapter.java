package adapters;

import java.sql.ResultSet;
import java.util.ArrayList;

import models.TourPackages;

public class TourPackagesAdapter {
	
	public ArrayList<TourPackages> getPopuler()
	{
		String sql = "SELECT * FROM tourpackages WHERE STR_TO_DATE(tourdate, '%d/%m/%Y') > SYSDATE() and status='regular' ORDER BY totalbooked DESC LIMIT 3";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<TourPackages> tourpackages = new ArrayList<TourPackages>();
		try {
			while(rs.next())
			{
				TourPackages tp = new TourPackages();
				tp.setTourid(rs.getInt("tourid"));
				tp.setTourname(rs.getString("tourname"));
				tp.setTourdate(rs.getString("tourdate"));
				tp.setTotalday(rs.getInt("totalday"));
				tp.setTotalnight(rs.getInt("totalnight"));
				tp.setStartcity(rs.getString("startcity"));
				tp.setEndcity(rs.getString("endcity"));
				tp.setVisitingcities(rs.getString("visitingcities"));
				tp.setPlacedetails(rs.getString("placedetails"));
				tp.setCostperperson(rs.getInt("costperperson"));
				tp.setCostperchildren(rs.getInt("costperchildren"));
				tp.setTotalbooked(rs.getInt("totalbooked"));
				tp.setTourdivision(rs.getString("tourdivision"));
				tp.setAdddate(rs.getString("adddate"));
				tp.setPickup(rs.getString("pickup"));
				tp.setDropoff(rs.getString("dropoff"));
				tp.setGuide(rs.getString("guide"));
				tp.setGuideid(rs.getInt("guideid"));
				tp.setLunch(rs.getString("lunch"));
				tp.setDinner(rs.getString("dinner"));
				tp.setTransport(rs.getString("transport"));
				tp.setRoomservice(rs.getString("roomservice"));
				tp.setImeagelink(rs.getString("imeagelink"));
				
				tourpackages.add(tp);
			}
			return tourpackages;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<TourPackages> getRecentlist(){
		
		String sql = "SELECT * FROM tourpackages WHERE STR_TO_DATE(tourdate, '%d/%m/%Y') > SYSDATE() and status='regular' ORDER BY adddate DESC LIMIT 3";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<TourPackages> recentlist =new ArrayList<TourPackages>();
		try{
			while (rs.next()) {
				TourPackages tp1=new TourPackages();
				tp1.setTourid(rs.getInt("tourid"));
				tp1.setTourname(rs.getString("tourname"));
				tp1.setTourdate(rs.getString("tourdate"));
				tp1.setTotalday(rs.getInt("totalday"));
				tp1.setTotalnight(rs.getInt("totalnight"));
				tp1.setStartcity(rs.getString("startcity"));
				tp1.setEndcity(rs.getString("endcity"));
				tp1.setVisitingcities(rs.getString("visitingcities"));
				tp1.setPlacedetails(rs.getString("placedetails"));
				tp1.setCostperperson(rs.getInt("costperperson"));
				tp1.setCostperchildren(rs.getInt("costperchildren"));
				tp1.setTotalbooked(rs.getInt("totalbooked"));
				tp1.setTourdivision(rs.getString("tourdivision"));
				tp1.setAdddate(rs.getString("adddate"));
				tp1.setPickup(rs.getString("pickup"));
				tp1.setDropoff(rs.getString("dropoff"));
				tp1.setGuide(rs.getString("guide"));
				tp1.setGuideid(rs.getInt("guideid"));
				tp1.setLunch(rs.getString("lunch"));
				tp1.setDinner(rs.getString("dinner"));
				tp1.setTransport(rs.getString("transport"));
				tp1.setRoomservice(rs.getString("roomservice"));
				tp1.setImeagelink(rs.getString("imeagelink"));
				recentlist.add(tp1);
				
			}
			return recentlist;
			}
		catch (Exception e) {
		e.printStackTrace();
			return null;
		}
		
	}
	
	public ArrayList<TourPackages> getDivlist() {
		
		String sql = "SELECT tourdivision,COUNT(*) AS totaltour FROM tourpackages WHERE STR_TO_DATE(tourdate, '%d/%m/%Y') > SYSDATE() and status='regular' GROUP BY tourdivision;";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		
		ArrayList<TourPackages> divlist=new ArrayList<TourPackages>();
		try{
			while(rs.next()){
				TourPackages tp2=new TourPackages();
				tp2.setTourdivision(rs.getString("tourdivision"));
				tp2.setCount(rs.getInt("totaltour"));
				divlist.add(tp2);
			}
			return divlist;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
	}

	public TourPackages getTourDetails(int tourid){
		String sql="Select * from tourpackages where tourid="+tourid;
		DataAccess da=new DataAccess();
		ResultSet rs=da.getResultSet(sql);
		TourPackages tp3=new TourPackages();
		try{
			if(rs.next())
			{
				tp3.setTourid(rs.getInt("tourid"));
				tp3.setTourname(rs.getString("tourname"));
				tp3.setTourdate(rs.getString("tourdate"));
				tp3.setTotalday(rs.getInt("totalday"));
				tp3.setTotalnight(rs.getInt("totalnight"));
				tp3.setStartcity(rs.getString("startcity"));
				tp3.setEndcity(rs.getString("endcity"));
				tp3.setVisitingcities(rs.getString("visitingcities"));
				tp3.setPlacedetails(rs.getString("placedetails"));
				tp3.setCostperperson(rs.getInt("costperperson"));
				tp3.setCostperchildren(rs.getInt("costperchildren"));
				tp3.setTotalbooked(rs.getInt("totalbooked"));
				tp3.setTourdivision(rs.getString("tourdivision"));
				tp3.setAdddate(rs.getString("adddate"));
				tp3.setPickup(rs.getString("pickup"));
				tp3.setDropoff(rs.getString("dropoff"));
				tp3.setGuide(rs.getString("guide"));
				tp3.setGuideid(rs.getInt("guideid"));
				tp3.setLunch(rs.getString("lunch"));
				tp3.setDinner(rs.getString("dinner"));
				tp3.setTransport(rs.getString("transport"));
				tp3.setRoomservice(rs.getString("roomservice"));
				tp3.setBreakfast(rs.getString("breakfast"));
				tp3.setImeagelink(rs.getString("imeagelink"));
				
			}
			return tp3;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	
	}
	
	public ArrayList<TourPackages> getAll()
	{
		String sql = "SELECT * FROM tourpackages WHERE STR_TO_DATE(tourdate, '%d/%m/%Y') > SYSDATE() and status='regular'";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<TourPackages> tourpackages = new ArrayList<TourPackages>();
		try {
			while(rs.next())
			{
				TourPackages tp = new TourPackages();
				tp.setTourid(rs.getInt("tourid"));
				tp.setTourname(rs.getString("tourname"));
				tp.setTourdate(rs.getString("tourdate"));
				tp.setTotalday(rs.getInt("totalday"));
				tp.setTotalnight(rs.getInt("totalnight"));
				tp.setStartcity(rs.getString("startcity"));
				tp.setEndcity(rs.getString("endcity"));
				tp.setVisitingcities(rs.getString("visitingcities"));
				tp.setPlacedetails(rs.getString("placedetails"));
				tp.setCostperperson(rs.getInt("costperperson"));
				tp.setCostperchildren(rs.getInt("costperchildren"));
				tp.setTotalbooked(rs.getInt("totalbooked"));
				tp.setTourdivision(rs.getString("tourdivision"));
				tp.setAdddate(rs.getString("adddate"));
				tp.setPickup(rs.getString("pickup"));
				tp.setDropoff(rs.getString("dropoff"));
				tp.setGuide(rs.getString("guide"));
				tp.setGuideid(rs.getInt("guideid"));
				tp.setLunch(rs.getString("lunch"));
				tp.setDinner(rs.getString("dinner"));
				tp.setTransport(rs.getString("transport"));
				tp.setRoomservice(rs.getString("roomservice"));
				tp.setImeagelink(rs.getString("imeagelink"));
				
				tourpackages.add(tp);
			}
			return tourpackages;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<TourPackages> getCompleted()
	{
		String sql = "SELECT * FROM tourpackages Where STR_TO_DATE(tourdate, '%d/%m/%Y') < SYSDATE() status='regular'";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<TourPackages> tourpackages = new ArrayList<TourPackages>();
		try {
			while(rs.next())
			{
				TourPackages tp = new TourPackages();
				tp.setTourid(rs.getInt("tourid"));
				tp.setTourname(rs.getString("tourname"));
				tp.setTourdate(rs.getString("tourdate"));
				tp.setTotalday(rs.getInt("totalday"));
				tp.setTotalnight(rs.getInt("totalnight"));
				tp.setStartcity(rs.getString("startcity"));
				tp.setEndcity(rs.getString("endcity"));
				tp.setVisitingcities(rs.getString("visitingcities"));
				tp.setPlacedetails(rs.getString("placedetails"));
				tp.setCostperperson(rs.getInt("costperperson"));
				tp.setCostperchildren(rs.getInt("costperchildren"));
				tp.setTotalbooked(rs.getInt("totalbooked"));
				tp.setTourdivision(rs.getString("tourdivision"));
				tp.setAdddate(rs.getString("adddate"));
				tp.setPickup(rs.getString("pickup"));
				tp.setDropoff(rs.getString("dropoff"));
				tp.setGuide(rs.getString("guide"));
				tp.setGuideid(rs.getInt("guideid"));
				tp.setLunch(rs.getString("lunch"));
				tp.setDinner(rs.getString("dinner"));
				tp.setTransport(rs.getString("transport"));
				tp.setRoomservice(rs.getString("roomservice"));
				tp.setImeagelink(rs.getString("imeagelink"));
				
				tourpackages.add(tp);
			}
			return tourpackages;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<TourPackages> getTourList(String tourdivision)
	{
		String sql = "Select * from tourpackages where tourdivision='"+tourdivision+"' and STR_TO_DATE(tourdate, '%d/%m/%Y') > SYSDATE() and status='regular'";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<TourPackages> tourpackages = new ArrayList<TourPackages>();
		try {
			while(rs.next())
			{
				TourPackages tp = new TourPackages();
				tp.setTourid(rs.getInt("tourid"));
				tp.setTourname(rs.getString("tourname"));
				tp.setTourdate(rs.getString("tourdate"));
				tp.setTotalday(rs.getInt("totalday"));
				tp.setTotalnight(rs.getInt("totalnight"));
				tp.setVisitingcities(rs.getString("visitingcities"));
				tp.setPlacedetails(rs.getString("placedetails"));
				tp.setCostperperson(rs.getInt("costperperson"));
				tp.setCostperchildren(rs.getInt("costperchildren"));
				tp.setTourdivision(rs.getString("tourdivision"));
				tp.setAdddate(rs.getString("adddate"));
				tp.setImeagelink(rs.getString("imeagelink"));
				
				tourpackages.add(tp);
			}
			return tourpackages;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int Insert(TourPackages tp){
		
		String sql="INSERT INTO tourpackages VALUES (null, '"+tp.getTourname()+"', '"+tp.getTourdate()+"', '"+tp.getTotalday()+"', '"+tp.getTotalnight()+"', '"+tp.getStartcity()+"', '"+tp.getEndcity()+"', '"+tp.getVisitingcities()+"', '"+tp.getPlacedetails()+"', '"+tp.getCostperperson()+"', '"+tp.getCostperchildren()+"', 0, 0, '"+tp.getTourdivision()+"', '"+tp.getAdddate()+"', '"+tp.getPickup()+"', '"+tp.getDropoff()+"', '"+tp.getGuide()+"', 0, '"+tp.getBreakfast()+"', '"+tp.getLunch()+"', '"+tp.getDinner()+"', 'Available', 'Available', 'null','regular') ;";
		String sql2=" SELECT LAST_INSERT_ID() AS tourid;";
		DataAccess da=new DataAccess();
		da.executeQuery(sql);
		System.out.println(sql);
		ResultSet rs=da.getResultSet(sql2);
		int ti=0;
		
		try {
			
			while(rs.next()){
				ti=rs.getInt("tourid");
				//return tourid;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		System.out.println(ti);
		return ti;
		
	}
	
	public void updateImeage(int tourid,String imeagelink){
		
		String sql="UPDATE tourpackages SET  imeagelink = '"+imeagelink+"' WHERE tourid ="+tourid;
		DataAccess da=new DataAccess();
		da.executeQuery(sql);
	}
	
	public void updateTour(TourPackages tp){
		String sql="UPDATE tourpackages SET  tourname = '"+tp.getTourname()+"', tourdate = '"+tp.getTourdate()+"', totalday = '"+tp.getTotalday()+"', totalnight = '"+tp.getTotalnight()+"', startcity = '"+tp.getStartcity()+"', endcity = '"+tp.getEndcity()+"', visitingcities = '"+tp.getVisitingcities()+"', placedetails = '"+tp.getPlacedetails()+"', costperperson = '"+tp.getCostperperson()+"', costperchildren = '"+tp.getCostperchildren()+"', tourdivision = '"+tp.getTourdivision()+"', pickup = '"+tp.getPickup()+"', dropoff = '"+tp.getDropoff()+"', guide = '"+tp.getGuide()+"',breakfast = '"+tp.getBreakfast()+"', lunch = '"+tp.getLunch()+"', dinner = '"+tp.getDinner()+"' WHERE tourid ="+tp.getTourid();
		DataAccess da=new DataAccess();
		da.executeQuery(sql);
	}

	public void cancelTour(int tourid){
		String sql="UPDATE tourpackages SET  totalbooked=0,totalchildbooked=0,status='canceled' where tourid="+tourid;
		DataAccess da=new DataAccess();
		da.executeQuery(sql);
	}

	public void regularTour(int tourid) {
		String sql="UPDATE tourpackages SET status='regular' where tourid="+tourid;
		DataAccess da=new DataAccess();
		da.executeQuery(sql);
	}
	
	public ArrayList<TourPackages> getCanceled()
	{
		String sql = "SELECT * FROM tourpackages WHERE status='canceled'";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<TourPackages> tourpackages = new ArrayList<TourPackages>();
		try {
			while(rs.next())
			{
				TourPackages tp = new TourPackages();
				tp.setTourid(rs.getInt("tourid"));
				tp.setTourname(rs.getString("tourname"));
				tp.setTourdate(rs.getString("tourdate"));
				tp.setTotalday(rs.getInt("totalday"));
				tp.setTotalnight(rs.getInt("totalnight"));
				tp.setStartcity(rs.getString("startcity"));
				tp.setEndcity(rs.getString("endcity"));
				tp.setVisitingcities(rs.getString("visitingcities"));
				tp.setPlacedetails(rs.getString("placedetails"));
				tp.setCostperperson(rs.getInt("costperperson"));
				tp.setCostperchildren(rs.getInt("costperchildren"));
				tp.setTotalbooked(rs.getInt("totalbooked"));
				tp.setTourdivision(rs.getString("tourdivision"));
				tp.setAdddate(rs.getString("adddate"));
				tp.setPickup(rs.getString("pickup"));
				tp.setDropoff(rs.getString("dropoff"));
				tp.setGuide(rs.getString("guide"));
				tp.setGuideid(rs.getInt("guideid"));
				tp.setLunch(rs.getString("lunch"));
				tp.setDinner(rs.getString("dinner"));
				tp.setTransport(rs.getString("transport"));
				tp.setRoomservice(rs.getString("roomservice"));
				tp.setImeagelink(rs.getString("imeagelink"));
				
				tourpackages.add(tp);
			}
			return tourpackages;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
