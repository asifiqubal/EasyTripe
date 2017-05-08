package controllers;

import java.io.IOException;
import java.text.ParseException;
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
 * Servlet implementation class TourDetailsServlet
 */
public class TourDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			
			request.setAttribute("link1", "/easytrip/login");
			request.setAttribute("link2", "/easytrip/adduser");
			request.setAttribute("value1", "Login");
			request.setAttribute("value2", "Registration");
			request.setAttribute("display", "none");
			request.setAttribute("book", "block");
			
		}
		else if(session.getAttribute("type").toString().equals("admin"))
		{
			request.setAttribute("link1", "/easytrip/adminhome");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", session.getAttribute("name"));
			request.setAttribute("value2", "Logout");
			request.setAttribute("display", "none");
			request.setAttribute("book", "none");
		}
		else if(session.getAttribute("type").toString().equals("user")){
			request.setAttribute("link1", "/easytrip/userhome");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", session.getAttribute("name"));
			request.setAttribute("value2", "Logout");
			request.setAttribute("display", "block");
			request.setAttribute("book", "none");
		}
		
		int tourid=Integer.parseInt(request.getParameter("tourid").toString());
		TourPackagesAdapter tpa=new TourPackagesAdapter();
		request.setAttribute("td", tpa.getTourDetails(tourid));
		TourPackages tp=new TourPackages();
		
		tp=tpa.getTourDetails(tourid);
		String startdate=tp.getTourdate().toString();
		int day=tp.getTotalday();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sdf.parse(startdate));
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		c.add(Calendar.DATE, day);  // number of days to add
		String enddate = sdf.format(c.getTime());
		request.setAttribute("enddate", enddate);
		request.setAttribute("tourid", tourid);
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_tourdetails.jsp");
		dsp.forward(request, response);
	}


}
