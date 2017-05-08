package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.TourPackagesAdapter;

/**
 * Servlet implementation class CanceledServelet
 */
public class CanceledServelet extends HttpServlet {
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
		
		TourPackagesAdapter tp=new TourPackagesAdapter();
		request.setAttribute("tourlist", tp.getCanceled());
		//HttpSession session=request.getSession();
		request.setAttribute("username",session.getAttribute("name"));
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_cancledtour.jsp");
		dsp.forward(request, response);
		}
	}

}
