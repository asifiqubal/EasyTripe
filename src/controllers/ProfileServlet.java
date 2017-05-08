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
 * Servlet implementation class ProfileServlet
 */
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			response.sendRedirect("/easytrip/login");
		}
		else if (session.getAttribute("type").toString().equals("admin")) {
			UsersAdapter ua = new UsersAdapter();
			request.setAttribute("ud", ua.getUserbyId(Integer.parseInt(session.getAttribute("userid").toString())));
			request.setAttribute("username",session.getAttribute("name"));
			RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_adminprofile.jsp");
			dsp.forward(request, response);
		}
		else if(session.getAttribute("type").toString().equals("user")){
			UsersAdapter ua = new UsersAdapter();
			request.setAttribute("ud", ua.getUserbyId(Integer.parseInt(session.getAttribute("userid").toString())));
		request.setAttribute("username",session.getAttribute("name"));
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_userprofile.jsp");
		dsp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String phone=request.getParameter("phone").toString();
		String address=request.getParameter("address").toString();
		String dob=request.getParameter("dob").toString();
		HttpSession session=request.getSession();
		Users us = new Users();
		us.setAddress(address);
		us.setDob(dob);
		us.setPhone(phone);
		us.setUserid(Integer.parseInt(session.getAttribute("userid").toString()));
		
		UsersAdapter ua = new UsersAdapter();
		ua.userUpdate(us);
		response.sendRedirect("/easytrip/profile");
	}

}
