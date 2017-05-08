package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.BookingAdapter;

/**
 * Servlet implementation class BookingListServlet
 */
public class BookingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null ||session.getAttribute("type").toString().equals("admin")) {
			response.sendRedirect("/easytrip/login");
		}
		else{
		int userid=Integer.parseInt(session.getAttribute("userid").toString());
		request.setAttribute("username",session.getAttribute("name"));
		BookingAdapter ba=new BookingAdapter();
		request.setAttribute("requestlist", ba.getUnpaidBookingList(userid));
		request.setAttribute("paidlist", ba.getPaidBookingList(userid));
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_userbookinglist.jsp");
		dsp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
