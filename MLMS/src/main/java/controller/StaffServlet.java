package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import javax.servlet.http.Part;
import dao.StaffDao;
import javabean.Imam;
import javabean.Staff;
/**
 * Servlet implementation class StaffServlet
 */
@WebServlet("/StaffServlet")
@MultipartConfig(maxFileSize = 16177215) //
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private StaffDao Sd;
	    public void init() {
	        Sd = new StaffDao();
	    }

	    
    public StaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   final String JDBC_DRIVER = "org.postgresql.Driver";
	        final String DB_URL = "jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und";
	        final String User = "ocetdbspxioaak";
	        final String Password = "046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e";
	        try {
	            Class.forName(JDBC_DRIVER);
	            Connection conn = DriverManager.getConnection(DB_URL, User, Password);

	            PreparedStatement stmt = conn.prepareStatement("select staffpicture from staff where staffid=?");
	            stmt.setLong(1, Long.valueOf(request.getParameter("id")));
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	 byte[] imgBytes = rs.getBytes("staffpicture");

		                response.getOutputStream().write((imgBytes));
	            }
	            conn.close();
	        } catch (Exception e) { 
	            e.printStackTrace();
	        }	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");


	        String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "addStaff":
	                    addStaff(request, response);
	                    break;
	                case "deleteStaff":
	                    deleteStaff(request,response);
	                    break;
	                case "addEdu":
	                    addEdu(request, response);
	                    break;
	              case "updateStaff":
	            	  updateStaff(request,response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;

	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }

	    }
	 private void addStaff(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	
		 
	        String name = request.getParameter("staffName");
	        String phone = request.getParameter("staffPhone");
	        String role = request.getParameter("staffRole");
	        String username = request.getParameter("staffUsername");
	        String password = request.getParameter("staffPassword");
	        int svid = Integer.parseInt(request.getParameter("supervisor"));
	        
	        InputStream inputStream = null;

	        Part filePart = request.getPart("staffPic");
			if (filePart != null) {
				// debug messages
				System.out.println(filePart.getName());
				System.out.println(filePart.getSize());
				System.out.println(filePart.getContentType());

				// obtains input stream of the upload file
				inputStream = filePart.getInputStream();
			}
	        
	        Staff s= new Staff();

	        s.setStaffName(name);
	        s.setStaffPhone(phone);
	        s.setStaffRole(role);
	        s.setStaffUsername(username);
	        s.setStaffPassword(password);
	        s.setSvid(svid);
	        s.setStaffpicture(inputStream);
	        
	        
	        
	        
	        Sd.addStaff(s);
	        response.sendRedirect("viewStaff.jsp");
	    }
	    private void deleteStaff(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        int id = Integer.parseInt(request.getParameter("staff"));
	        Sd.deleteStaff(id);
	        response.sendRedirect("viewStaff.jsp");
	    }
	    private void addEdu(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	
		 
	        int id = Integer.parseInt(request.getParameter("id"));
	        String edu = request.getParameter("imamEdu");
	       
	        
	        Imam i= new Imam();

	        i.setId(id);
	        i.setEducation(edu);
	        
	        Sd.addEdu(i);
	        
	      response.sendRedirect("viewStaff.jsp");
	    }
	    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	
		 
	        String name = request.getParameter("staffName");
	        String phone = request.getParameter("staffPhone");
	        String username = request.getParameter("staffUsername");
	        String password = request.getParameter("staffPassword");

	        int id = Integer.parseInt(request.getParameter("id"));
	        	
	        InputStream inputStream = null;

	        Part filePart = request.getPart("staffPic");
			if (filePart != null) {
				// debug messages
				System.out.println(filePart.getName());
				System.out.println(filePart.getSize());
				System.out.println(filePart.getContentType());

				// obtains input stream of the upload file
				inputStream = filePart.getInputStream();
			}
	        Staff s= new Staff();

	        s.setStaffName(name);
	        s.setStaffPhone(phone);
	        s.setStaffUsername(username);
	        s.setStaffPassword(password);
	        s.setStaffpicture(inputStream);
	        s.setId(id);
	        
	        
	        
	        Sd.updateStaff(s);
	        response.sendRedirect("viewStaff.jsp");
	    }
	    private void cancel(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        
	        response.sendRedirect("viewStaff.jsp");
	    }
}
