package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.BookingAdapter;
import adapters.TourPackagesAdapter;

/**
 * Servlet implementation class MakeRegularServlet
 */
public class MakeRegularServlet extends HttpServlet {
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
		int tourid=Integer.parseInt(request.getParameter("tourid").toString());
		
		TourPackagesAdapter tpa = new TourPackagesAdapter();
		tpa.regularTour(tourid);
		
		BookingAdapter bk = new BookingAdapter();
		bk.regularTour(tourid);
		response.sendRedirect("/easytrip/managetour");
		}
	}

}
