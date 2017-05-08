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
 * Servlet implementation class BookingdetailsServlet
 */
public class BookingdetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("type") == null || session.getAttribute("type").toString().equals("user")) {
			response.sendRedirect("/easytrip/login");
		} else {
			int tourid = Integer.parseInt(request.getParameter("tourid").toString());
			request.setAttribute("username", session.getAttribute("name"));
			BookingAdapter bk = new BookingAdapter();
			request.setAttribute("bookinglist", bk.getBookinglist(tourid));
			// HttpSession session=request.getSession();
			session.setAttribute("tourid", tourid);

			RequestDispatcher dsp = request.getRequestDispatcher("/WEB-INF/views/view_adminbookinglist.jsp");
			dsp.forward(request, response);
		}

	}

}
