package controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import adapters.BookingAdapter;
import adapters.TourPackagesAdapter;
import models.Booking;
import models.TourPackages;

/**
 * Servlet implementation class BookServlet
 */
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tourid=Integer.parseInt(request.getParameter("tourid").toString());
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			session.setAttribute("tourid",tourid);
			response.sendRedirect("/easytrip/login");
		}
		else if(session.getAttribute("type").toString().equals("admin"))
		{
			response.sendRedirect("/easytrip/adminhome");
		}
		else if(session.getAttribute("type").toString().equals("user")){
			request.setAttribute("link1", "/easytrip/userhome");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", session.getAttribute("name"));
			request.setAttribute("value2", "Logout");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int tourid=Integer.parseInt(request.getParameter("tourid").toString());
		int userid=Integer.parseInt(session.getAttribute("userid").toString());
		int adultnum=Integer.parseInt(request.getParameter("ani").toString());
		int childnum=Integer.parseInt(request.getParameter("cni").toString());
		String name=session.getAttribute("name").toString();
		
		TourPackagesAdapter tpa=new TourPackagesAdapter();
		request.setAttribute("td", tpa.getTourDetails(tourid));
		TourPackages tp=new TourPackages();		
		tp=tpa.getTourDetails(tourid);
		int cpp=tp.getCostperperson();
		int cpc=tp.getCostperchildren();
		int totalcost=(adultnum*cpp)+(childnum*cpc);
		String bookingdate = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
		
		Booking bk=new Booking();
		
		bk.setUserid(userid);
		bk.setTourid(tourid);
		bk.setAdultnum(adultnum);
		bk.setChildnum(childnum);
		bk.setTotalcost(totalcost);
		bk.setBookingdate(bookingdate);
		bk.setUsername(name);
		
		BookingAdapter ba = new BookingAdapter();
		ba.insert(bk);
		session.removeAttribute("tourid");
		response.sendRedirect("/easytrip/bookinglist");
		
		
	}

}
