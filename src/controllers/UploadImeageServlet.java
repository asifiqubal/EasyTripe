package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import adapters.TourPackagesAdapter;
import models.TourPackages;

/**
 * Servlet implementation class UploadImeageServlet
 */
public class UploadImeageServlet extends HttpServlet {
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
		RequestDispatcher dsp = request.getRequestDispatcher("/WEB-INF/views/view_imeageupload.jsp");
		dsp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		  String imeagelink=null;
		  if(!ServletFileUpload.isMultipartContent(request)){
		   //out.println("Nothing to upload");
		   return; 
		  }
		  FileItemFactory itemfactory = new DiskFileItemFactory(); 
		  ServletFileUpload upload = new ServletFileUpload(itemfactory);
		  try{
		   List<FileItem>  items = upload.parseRequest(new ServletRequestContext(request));
		   for(FileItem item:items){
		     
		    String contentType = item.getContentType();
		    
		    String name="img";
		    File uploadDir = new File("D:\\AIUB/ATP-I/Work/EasyTripe/WebContent/PUBLIC/data/frontFiles/tours/tours_image");
		    File file = File.createTempFile(name,".jpg",uploadDir);
		    item.write(file);
		    imeagelink=file.getName();
		   // out.println(file.getAbsolutePath());
		   }
		  }
		  catch(FileUploadException e){
		    
		   //out.println("upload fail");
		  }
		  catch(Exception ex){
		    
		   //out.println("can't save");
		  }
		  HttpSession session=request.getSession();
		  int tourid=Integer.parseInt(session.getAttribute("tourid").toString());
		  session.removeAttribute("tourid");
		  TourPackagesAdapter tp = new TourPackagesAdapter();
		  tp.updateImeage(tourid,imeagelink);
		  response.sendRedirect("/easytrip/managetour");
		  
		 }
	

}
