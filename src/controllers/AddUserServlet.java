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
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
			
			response.sendRedirect("/easytrip/home");
		}
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_adduser.jsp");
		dsp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name").toString();
		String email=request.getParameter("email").toString();
		String phone=request.getParameter("phone").toString();
		String address=request.getParameter("address").toString();
		String dob=request.getParameter("dob").toString();
		String username=request.getParameter("username").toString();
		String password=request.getParameter("password").toString();
		
		Users us = new Users();
		us.setAddress(address);
		us.setDob(dob);
		us.setEmail(email);
		us.setName(name);
		us.setPhone(phone);
		
		UsersAdapter ua = new UsersAdapter();
		ua.Insurt(us,username,password);
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			response.sendRedirect("/easytrip/login");
		}
		else if(session.getAttribute("type").toString().equals("admin"))
		{
			response.sendRedirect("/easytrip/manageuser");
		}
		
	}

}
