package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ScheduleDao;
import javabean.Schedule;

/**
 * Servlet implementation class ScheduleServlet
 */
@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private ScheduleDao scd;
	    public void init() {
	        scd = new ScheduleDao();
	    }
	    
    public ScheduleServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");

	        String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "addSchedule":
	                    addSchedule(request, response);
	                    break;
	             
	                case "updateSchedule":
	                    updateSchedule(request,response);
	                    break;
	                case "cancel":
	                    cancel(request, response);
	                    break;
	               
	            }

	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	}
	private void addSchedule(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String date = request.getParameter("scDate");
        String time = request.getParameter("scTime");
        int spk = Integer.parseInt(request.getParameter("scSpeaker"));
        int tpc = Integer.parseInt(request.getParameter("scTopic"));
        String times = request.getParameter("scTimes");
        int spks = Integer.parseInt(request.getParameter("scSpeakers"));
        int tpcs = Integer.parseInt(request.getParameter("scTopics"));
        
        String date2 = request.getParameter("scDate2");
        String time2 = request.getParameter("scTime2");
        int spk2 = Integer.parseInt(request.getParameter("scSpeaker2"));
        int tpc2 = Integer.parseInt(request.getParameter("scTopic2"));
        String times2 = request.getParameter("scTimes2");
        int spks2 = Integer.parseInt(request.getParameter("scSpeakers2"));
        int tpcs2 = Integer.parseInt(request.getParameter("scTopics2"));
        
        String date3 = request.getParameter("scDate3");
        String time3 = request.getParameter("scTime3");
        int spk3 = Integer.parseInt(request.getParameter("scSpeaker3"));
        int tpc3 = Integer.parseInt(request.getParameter("scTopic3"));
        String times3 = request.getParameter("scTimes3");
        int spks3 = Integer.parseInt(request.getParameter("scSpeakers3"));
        int tpcs3 = Integer.parseInt(request.getParameter("scTopics3"));
        
        String date4 = request.getParameter("scDate4");
        String time4 = request.getParameter("scTime4");
        int spk4 = Integer.parseInt(request.getParameter("scSpeaker4"));
        int tpc4 = Integer.parseInt(request.getParameter("scTopic4"));
        String times4 = request.getParameter("scTimes4");
        int spks4 = Integer.parseInt(request.getParameter("scSpeakers4"));
        int tpcs4 = Integer.parseInt(request.getParameter("scTopics4"));
        
        String date5 = request.getParameter("scDate5");
        String time5 = request.getParameter("scTime5");
        int spk5 = Integer.parseInt(request.getParameter("scSpeaker5"));
        int tpc5 = Integer.parseInt(request.getParameter("scTopic5"));
        String times5 = request.getParameter("scTimes5");
        int spks5 = Integer.parseInt(request.getParameter("scSpeakers5"));
        int tpcs5 = Integer.parseInt(request.getParameter("scTopics5"));
        
        String date6 = request.getParameter("scDate6");
        String time6 = request.getParameter("scTime6");
        int spk6 = Integer.parseInt(request.getParameter("scSpeaker6"));
        int tpc6 = Integer.parseInt(request.getParameter("scTopic6"));
        String times6 = request.getParameter("scTimes6");
        int spks6 = Integer.parseInt(request.getParameter("scSpeakers6"));
        int tpcs6 = Integer.parseInt(request.getParameter("scTopics6"));
        
        String date7 = request.getParameter("scDate7");
        String time7 = request.getParameter("scTime7");
        int spk7 = Integer.parseInt(request.getParameter("scSpeaker7"));
        int tpc7= Integer.parseInt(request.getParameter("scTopic7"));
        String times7 = request.getParameter("scTimes7");
        int spks7 = Integer.parseInt(request.getParameter("scSpeakers7"));
        int tpcs7 = Integer.parseInt(request.getParameter("scTopics7"));
      
        HttpSession session=request.getSession();  
        int staffid = (Integer) session.getAttribute("staffid");
        
        Schedule sc = new Schedule();

        sc.setScheduleDate(Date.valueOf(date));
        sc.setScheduleTime(time);
        sc.setSpeakerId(spk);
        sc.setTopicId(tpc);
        sc.setScheduleTime2(times);
        sc.setSpeakerId2(spks);
        sc.setTopicId2(tpcs);
        
        sc.setScheduleDate_2(Date.valueOf(date2));
        sc.setScheduleTime_2(time2);
        sc.setSpeakerId_2(spk2);
        sc.setTopicId_2(tpc2);
        sc.setScheduleTime2_2(times2);
        sc.setSpeakerId2_2(spks2);
        sc.setTopicId2_2(tpcs2);

        sc.setScheduleDate_3(Date.valueOf(date3));
        sc.setScheduleTime_3(time3);
        sc.setSpeakerId_3(spk3);
        sc.setTopicId_3(tpc3);
        sc.setScheduleTime2_3(times3);
        sc.setSpeakerId2_3(spks3);
        sc.setTopicId2_3(tpcs3);
        
        sc.setScheduleDate_4(Date.valueOf(date4));
        sc.setScheduleTime_4(time4);
        sc.setSpeakerId_4(spk4);
        sc.setTopicId_4(tpc4);
        sc.setScheduleTime2_4(times4);
        sc.setSpeakerId2_4(spks4);
        sc.setTopicId2_4(tpcs4);
        
        sc.setScheduleDate_5(Date.valueOf(date5));
        sc.setScheduleTime_5(time5);
        sc.setSpeakerId_5(spk5);
        sc.setTopicId_5(tpc5);
        sc.setScheduleTime2_5(times5);
        sc.setSpeakerId2_5(spks5);
        sc.setTopicId2_5(tpcs5);
        
        sc.setScheduleDate_6(Date.valueOf(date6));
        sc.setScheduleTime_6(time6);
        sc.setSpeakerId_6(spk6);
        sc.setTopicId_6(tpc6);
        sc.setScheduleTime2_6(times6);
        sc.setSpeakerId2_6(spks6);
        sc.setTopicId2_6(tpcs6);
        
        sc.setScheduleDate_7(Date.valueOf(date7));
        sc.setScheduleTime_7(time7);
        sc.setSpeakerId_7(spk7);
        sc.setTopicId_7(tpc7);
        sc.setScheduleTime2_7(times7);
        sc.setSpeakerId2_7(spks7);
        sc.setTopicId2_7(tpcs7);
        
        sc.setStaffid(staffid);

        scd.addSchedule(sc);
        response.sendRedirect("senaraiJadual.jsp");
    }

	private void updateSchedule(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int spk = Integer.parseInt(request.getParameter("scSpeaker"));
        int tpc = Integer.parseInt(request.getParameter("scTopic"));
        String date = request.getParameter("scDate");

        Schedule sc = new Schedule();

        sc.setId(id);
        sc.setSpeakerId(spk);
        sc.setTopicId(tpc);
        sc.setScheduleDate(Date.valueOf(date));
        
        scd.updateSchedule(sc);
        response.sendRedirect("senaraiJadual.jsp");
    }
	private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		response.sendRedirect("senaraiJadual.jsp");
	}
	

}
