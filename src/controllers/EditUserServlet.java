package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adapters.UsersAdapter;
import models.Users;

/**
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
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
		//HttpSession session=request.getSession();
		if(uid.equals(null)){
			response.sendRedirect("/easytrip/manageuser");
		}
		else
		{
			request.setAttribute("username",session.getAttribute("name"));
			int userid=Integer.parseInt(uid);
			UsersAdapter ua=new UsersAdapter();
			request.setAttribute("ud", ua.getUserbyId(userid));
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/view_edituser.jsp");
			rd.forward(request, response);
			
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userid=Integer.parseInt(request.getParameter("userid").toString());
		String name=request.getParameter("name").toString();
		String email=request.getParameter("email").toString();
		String phone=request.getParameter("phone").toString();
		String address=request.getParameter("address").toString();
		String dob=request.getParameter("dob").toString();
		String status=request.getParameter("status").toString();
		
		Users u = new Users();
		
		u.setAddress(address);
		u.setDob(dob);
		u.setEmail(email);
		u.setName(name);
		u.setPhone(phone);
		u.setStatus(status);
		u.setUserid(userid);
		
		UsersAdapter ua = new UsersAdapter();
		ua.update(u);
		response.sendRedirect("/easytrip/manageuser");
	}

}
