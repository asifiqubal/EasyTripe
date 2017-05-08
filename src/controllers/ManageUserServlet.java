package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.UsersAdapter;

/**
 * Servlet implementation class ManageUserServlet
 */
public class ManageUserServlet extends HttpServlet {
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
		
		UsersAdapter ua=new UsersAdapter();
		request.setAttribute("userlist", ua.getAllUserList());
		request.setAttribute("username",session.getAttribute("name"));
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_manageuser.jsp");
		dsp.forward(request, response);
		}
	}
}
	
