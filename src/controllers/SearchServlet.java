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
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TourPackagesAdapter tp=new TourPackagesAdapter();
		request.setAttribute("tourlist", tp.getAll());
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			
			request.setAttribute("link1", "/easytrip/login");
			request.setAttribute("link2", "/easytrip/registration");
			request.setAttribute("value1", "Login");
			request.setAttribute("value2", "Registration");
		}
		else if(session.getAttribute("type").toString().equals("admin"))
		{
			request.setAttribute("link1", "/easytrip/admin");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", "Hi,Admin");
			request.setAttribute("value2", "Logout");
		}
		else if(session.getAttribute("type").toString().equals("user")){
			request.setAttribute("link1", "/easytrip/user");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", "Hi,User");
			request.setAttribute("value2", "Logout");
		}
		
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_search.jsp");
		dsp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
