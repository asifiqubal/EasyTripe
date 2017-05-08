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
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errormessage=" ";
		request.setAttribute("error", errormessage);
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_login.jsp");
		dsp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username").toString();
        String password=request.getParameter("password").toString();
        
       /* request.setAttribute("username",password);
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/testview.jsp");
        disp.forward(request, response);*/
        if(username.equals("")||password.equals(""))
        {
            String error = "**USERNAME & PASSWORD IS REQUIRED";
            request.setAttribute("errorMessage",error);
            RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/view_login.jsp");
            disp.forward(request, response);
        }
        else
        {
            UsersAdapter useradapt = new UsersAdapter();
            Users user= new Users(); 
            user=useradapt.getLogin(username, password);
             
            if(user==null)
            {
                String error = "**INVALID USERNAME & PASSWORD";
                request.setAttribute("errorMessage",error);
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/view_login.jsp");
                disp.forward(request, response);
            }
            else
            {
                int userid=user.getUserid();
                String type=user.getType();
                String name=user.getName();
                 
                HttpSession session = request.getSession();
                session.setAttribute("userid",userid);
                session.setAttribute("name",name);
                session.setAttribute("type",type);
                 
                if(type.equals("user"))
                {
                	
                	
                	if(session.getAttribute("tourid")==null)
                	{
                    response.sendRedirect("/easytrip/userhome");
                	}
                	else{
                		int tourid= Integer.parseInt(session.getAttribute("tourid").toString());
                		response.sendRedirect("/easytrip/tourdetails?tourid="+tourid);}
                }
                else if(type.equals("admin"))
                {
                    response.sendRedirect("/easytrip/adminhome");
                }
            }
        }
	}

}
