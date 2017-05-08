package controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.TourPackagesAdapter;
import models.TourPackages;

/**
 * Servlet implementation class AddTourServlet
 */
public class AddTourServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			response.sendRedirect("/easytrip/login");
		}
		
		else if(session.getAttribute("type").toString().equals("user")){
			response.sendRedirect("/easytrip/login");
		}
		else
			request.setAttribute("username",session.getAttribute("name"));
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_addtour.jsp");
		dsp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String imeagelink;
		String tourname=request.getParameter("tourname");
		String tourdate=request.getParameter("tourdate");
		int totalday=Integer.parseInt(request.getParameter("totalday").toString());
		int totalnight=Integer.parseInt(request.getParameter("totalnight").toString());
		String startcity=request.getParameter("startcity");
		String endcity=request.getParameter("endcity");
		String visitingcities=request.getParameter("visitingcities");
		String placedetails = request.getParameter("placedetails");
		int costperperson = Integer.parseInt(request.getParameter("costperperson").toString());
		int costperchildren=Integer.parseInt(request.getParameter("costperchildren").toString());
		String tourdivision=request.getParameter("tourdivision");
		String adddate = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
		String pickup=request.getParameter("pickup");
		String dropoff=request.getParameter("dropoff");
		String guide=request.getParameter("guide");
		String breakfast=request.getParameter("breakfast");
		String lunch=request.getParameter("lunch");
		String dinner=request.getParameter("dinner");
		TourPackages tp=new TourPackages();
		
		
		
		//TourPackages tp=new TourPackages();
		tp.setAdddate(adddate);
		tp.setBreakfast(breakfast);
		tp.setCostperchildren(costperchildren);
		tp.setCostperperson(costperperson);
		tp.setDinner(dinner);
		tp.setDropoff(dropoff);
		tp.setEndcity(endcity);
		tp.setGuide(guide);
		//tp.setImeagelink(imeagelink);
		tp.setLunch(lunch);
		tp.setPickup(pickup);
		tp.setStartcity(startcity);
		tp.setTotalday(totalday);
		tp.setTotalnight(totalnight);
		tp.setTourdate(tourdate);
		tp.setTourdivision(tourdivision);
		tp.setTourname(tourname);
		tp.setVisitingcities(visitingcities);
		tp.setPlacedetails(placedetails);
		
		TourPackagesAdapter tpa = new TourPackagesAdapter();
		int tourid=tpa.Insert(tp);
		HttpSession session=request.getSession();
		session.setAttribute("tourid", tourid);
		response.sendRedirect("/easytrip/uploadimeage");
		
	}

}
