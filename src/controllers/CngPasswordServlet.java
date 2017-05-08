package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.BooleanLiteral;

import adapters.LoginAdapter;
import adapters.UsersAdapter;
import models.Login;

/**
 * Servlet implementation class CngPasswordServlet
 */
public class CngPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errormessage=" ";
		request.setAttribute("error", errormessage);
		HttpSession session=request.getSession();
		if (session.getAttribute("type")==null) {
			response.sendRedirect("/easytrip/login");
		}
		else if (session.getAttribute("type").toString().equals("admin")) {
			request.setAttribute("username",session.getAttribute("name"));
			RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_admincngpassword.jsp");
			dsp.forward(request, response);
		}
		else if(session.getAttribute("type").toString().equals("user")){
		request.setAttribute("username",session.getAttribute("name"));
		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_usercngpassword.jsp");
		dsp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		String newpassword=request.getParameter("password").toString();
		String oldpassword=request.getParameter("oldpassword").toString();
		if(newpassword.equals("")||oldpassword.equals(""))
        {
            String error = "**New Passwor & Old PASSWORD IS REQUIRED";
            request.setAttribute("errorMessage",error);
            if (session.getAttribute("type").toString().equals("admin")) {
    			request.setAttribute("username",session.getAttribute("name"));
    			RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_admincngpassword.jsp");
    			dsp.forward(request, response);
    		}
    		else if(session.getAttribute("type").toString().equals("user")){
    		request.setAttribute("username",session.getAttribute("name"));
    		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_usercngpassword.jsp");
    		dsp.forward(request, response);
    		}
        }
		else {
			
			Login lg = new Login();
			lg.setUserid(Integer.parseInt(session.getAttribute("userid").toString()));
			lg.setPassword(oldpassword);
			
			LoginAdapter la = new LoginAdapter();
			boolean cp=la.checkPass(lg);
			if(cp==true){
				la.update(lg,newpassword);
				String sm = "Password Change Successfully";
	            request.setAttribute("sm",sm);
	            if (session.getAttribute("type").toString().equals("admin")) {
	    			request.setAttribute("username",session.getAttribute("name"));
	    			RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_admincngpassword.jsp");
	    			dsp.forward(request, response);
	    		}
	    		else if(session.getAttribute("type").toString().equals("user")){
	    		request.setAttribute("username",session.getAttribute("name"));
	    		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_usercngpassword.jsp");
	    		dsp.forward(request, response);
	    		}
			}
			else if (cp==false) {
				 String error = "**Old Password Not Match";
		            request.setAttribute("errorMessage",error);
		            if (session.getAttribute("type").toString().equals("admin")) {
		    			request.setAttribute("username",session.getAttribute("name"));
		    			RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_admincngpassword.jsp");
		    			dsp.forward(request, response);
		    		}
		    		else if(session.getAttribute("type").toString().equals("user")){
		    		request.setAttribute("username",session.getAttribute("name"));
		    		RequestDispatcher dsp=request.getRequestDispatcher("/WEB-INF/views/view_usercngpassword.jsp");
		    		dsp.forward(request, response);
		    		}
			}
			
			
			
		}
	}

}
