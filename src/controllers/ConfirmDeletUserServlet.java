package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.UsersAdapter;

/**
 * Servlet implementation class ConfirmDeletUserServlet
 */
public class ConfirmDeletUserServlet extends HttpServlet {
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
		String uid=request.getParameter("userid").toString();
		if(uid.equals(null)){
			response.sendRedirect("/easytrip/manageuser");
		}
		else
		{
			int userid=Integer.parseInt(uid);
			UsersAdapter ua=new UsersAdapter();
			ua.deleteUser(userid);
			response.sendRedirect("/easytrip/manageuser");
			
		}
		}
	}

}
