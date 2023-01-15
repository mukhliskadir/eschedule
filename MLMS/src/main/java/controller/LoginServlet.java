package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpS	ervlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		  String action = request.getParameter("action");

	        try {
	            switch (action) {
	                case "logout":
	                    logout(request, response);
	                    break;
	              
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
		
	}
	private void logout(HttpServletRequest request, HttpServletResponse response)
          throws SQLException, IOException {
		  HttpSession session = request.getSession();
	        session.removeAttribute("staffid");
	        session.removeAttribute("staffname");
	        session.removeAttribute("staffrole");

	        session.invalidate();
	        response.sendRedirect("index.jsp");
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
                case "login":
                    stafflogin(request, response);
                    break;

              
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
       
}
private void stafflogin(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {

        Class.forName("org.postgresql.Driver");
        String dbURL = "jdbc:postgresql://ep-winter-moon-258448.ap-southeast-1.aws.neon.tech/neondb";
	    String user = "mukhliskadir";
	    String pass = "NGx9KZVkQ3am";
	    
        Connection con = DriverManager.getConnection(dbURL, user, pass);

        String sql  = "select * from staff";

        if (con != null){
            Statement statement = con.createStatement();
            ResultSet res = statement.executeQuery(sql);

            while (res.next()){
                if(username.equals(res.getString(4)) && password.equals(res.getString(5)))
                {

                	session.setAttribute("staffid", res.getInt(1));
                    session.setAttribute("staffname",res.getString(2));
                    session.setAttribute("staffrole",res.getString(7));

     	     
                    response.sendRedirect("viewSpeaker.jsp");


                }else {}

            }
            response.setContentType("text/html");  
            out.println("<script type=\"text/javascript\">");  
            out.println("alert('Invalid username or password');");  
            out.println("window.location.assign('index.jsp');");  
            out.println("</script>");


        }

    }catch (Exception e){
        e.printStackTrace();
    }
}
}
