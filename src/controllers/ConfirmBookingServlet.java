package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import adapters.BookingAdapter;

/**
 * Servlet implementation class ConfirmBookingServlet
 */
public class ConfirmBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null ||session.getAttribute("type").toString().equals("user")) {
			response.sendRedirect("/easytrip/login");
		}
		else{
		
		int bookingid=Integer.parseInt(request.getParameter("bookingid").toString());
		int an=Integer.parseInt(request.getParameter("an").toString());
		int cn=Integer.parseInt(request.getParameter("cn").toString());
		int tb=an+cn;
		BookingAdapter bk = new BookingAdapter();
		bk.ConfirmTour(bookingid);
		
		//HttpSession session=request.getSession();
		int tourid=Integer.parseInt(session.getAttribute("tourid").toString());		
		session.removeAttribute("tourid");
		response.sendRedirect("/easytrip/bookingdetails?tourid="+tourid);
		}
		
	}

}
