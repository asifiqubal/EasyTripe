package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			
			request.setAttribute("link1", "/easytrip/login");
			request.setAttribute("link2", "/easytrip/adduser");
			request.setAttribute("value1", "Login");
			request.setAttribute("value2", "Registration");
		}
		else if(session.getAttribute("type").toString().equals("admin"))
		{
			request.setAttribute("link1", "/easytrip/adminhome");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", session.getAttribute("name"));
			request.setAttribute("value2", "Logout");
		}
		else if(session.getAttribute("type").toString().equals("user")){
			request.setAttribute("link1", "/easytrip/userhome");
			request.setAttribute("link2", "/easytrip/logout");
			request.setAttribute("value1", session.getAttribute("name"));
			request.setAttribute("value2", "Logout");
		}
		
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_contact.jsp");
		dsp.forward(request, response);
	}

}
