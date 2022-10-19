package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import javax.servlet.http.Part;
import dao.AnnouncementDao;
import javabean.Announcement;
/**
 * Servlet implementation class AnnouncementServlet
 */
@WebServlet("/AnnouncementServlet")
@MultipartConfig(maxFileSize = 16177215) //
public class AnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private AnnouncementDao ad;
    public void init() {
        ad = new AnnouncementDao();
    }
    
    
    public AnnouncementServlet() {
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

	            PreparedStatement stmt = conn.prepareStatement("select announcementpicture from announcement where announcementid=?");
	            stmt.setLong(1, Long.valueOf(request.getParameter("id")));
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                byte[] imgBytes = rs.getBytes("announcementpicture");

	                response.getOutputStream().write((imgBytes));
	            }
	            conn.close();
	        } catch (Exception e) { 
	            e.printStackTrace();
	        }
	    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");

	        String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "addAnnouncement":
	                	addAnnouncement(request, response);
	                    break;
	                case "deleteAnnouncement":
	                	deleteAnnouncement(request,response);
	                    break;
	                case "updateAnnouncement":
	                	updateAnnouncement(request,response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;
	               
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	    
	}
	private void addAnnouncement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String title = request.getParameter("aTitle");
        String desc = request.getParameter("aDesc");
        String date = request.getParameter("aDate");
        String timme = request.getParameter("aTime");
        
		InputStream inputStream = null;

        Part filePart = request.getPart("aPicture");
		if (filePart != null) {
			// debug messages
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		 HttpSession session=request.getSession();  
	     int staff = (Integer) session.getAttribute("staffid");

        Announcement anc = new Announcement();

        anc.setPicture(inputStream);
        anc.setTitle(title);
        anc.setDescr(desc);
        anc.setDate(Date.valueOf(date));
        anc.setTime(timme);
        anc.setStaffid(staff);
        
        ad.addAnnouncement(anc);
        response.sendRedirect("viewAnnouncement.jsp");
    }
	private void deleteAnnouncement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("aId"));
        ad.deleteAnnouncement(id);
        response.sendRedirect("viewAnnouncement.jsp");
    }
	private void updateAnnouncement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("aTitle");
        String desc = request.getParameter("aDesc");
        String date = request.getParameter("aDate");
        String timme = request.getParameter("aTime");
 
        InputStream inputStream = null;

        Part filePart = request.getPart("aPicture");
		if (filePart != null) {
			// debug messages
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		HttpSession session=request.getSession();  
	    int staff = (Integer) session.getAttribute("staffid");
        Announcement anc = new Announcement();
        
        anc.setId(id);
        anc.setPicture(inputStream);
        anc.setTitle(title);
        anc.setDescr(desc);
        anc.setDate(Date.valueOf(date));
        anc.setTime(timme);
        anc.setStaffid(staff);

        ad.updateAnnouncement(anc);

        response.sendRedirect("viewAnnouncement.jsp");
    }
	
	private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		response.sendRedirect("viewAnnouncement.jsp");
	}
}
