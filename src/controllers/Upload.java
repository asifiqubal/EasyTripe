package controllers;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;



/**
 * Servlet implementation class Upload
 */
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dsp = request.getRequestDispatcher("/WEB-INF/views/up.jsp");
		dsp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		   
		  if(!ServletFileUpload.isMultipartContent(request)){
		   out.println("Nothing to upload");
		   return; 
		  }
		  FileItemFactory itemfactory = new DiskFileItemFactory(); 
		  ServletFileUpload upload = new ServletFileUpload(itemfactory);
		  try{
		   List<FileItem>  items = upload.parseRequest(new ServletRequestContext(request));
		   for(FileItem item:items){
		     
		    String contentType = item.getContentType();
		    
		    String name="adsfj";
		    File uploadDir = new File("D:\\AIUB/ATP-I/Work/EasyTripe/WebContent/PUBLIC/img");
		    File file = File.createTempFile(name,".jpg",uploadDir);
		    item.write(file);
		 
		    System.out.println(file.getName());
		    System.out.println(file.getPath());
		    System.out.println(file.getCanonicalPath());
		   }
		  }
		  catch(FileUploadException e){
		    
		   out.println("upload fail");
		  }
		  catch(Exception ex){
		    
		   out.println("can't save");
		  }
		 }
}
