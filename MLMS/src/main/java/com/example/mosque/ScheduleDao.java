package com.example.mosque;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class ScheduleDao {
		String dbURL = "jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und";
	    String user = "ocetdbspxioaak";
	    String pass = "046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e";
	    
	    protected Connection getConnection() {
	        Connection con = null;
	        try {
	            Class.forName("org.postgresql.Driver");
	            con = DriverManager.getConnection(dbURL, user, pass);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        return con;

	    }
	    public void addSchedule (Schedule sc) throws SQLException {

	        try (Connection con = getConnection();
	             PreparedStatement ps = con.prepareStatement
	                     ("insert into schedule(scheduledate,scheduletime,speakerid,topicid,staffid) "
	                     		+ "values(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),"
	                     		+ "(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?)"))
	        {

	             	ps.setDate(1,sc.getScheduleDate());
		            ps.setString(2, sc.getScheduleTime());
		            ps.setInt(3,sc.getSpeakerId());
		            ps.setInt(4, sc.getTopicId());
		            ps.setInt(5, sc.getStaffid());
		            
		            ps.setDate(6,sc.getScheduleDate());
		            ps.setString(7, sc.getScheduleTime2());
		            ps.setInt(8, sc.getSpeakerId2());
		            ps.setInt(9, sc.getTopicId2());
		            ps.setInt(10, sc.getStaffid());
		            
		            ps.setDate(11,sc.getScheduleDate_2());
		            ps.setString(12, sc.getScheduleTime_2());
		            ps.setInt(13,sc.getSpeakerId_2());
		            ps.setInt(14, sc.getTopicId_2());
		            ps.setInt(15, sc.getStaffid());
	            
		            ps.setDate(16,sc.getScheduleDate_2());
		            ps.setString(17, sc.getScheduleTime2_2());
		            ps.setInt(18, sc.getSpeakerId2_2());
		            ps.setInt(19, sc.getTopicId2_2());
		            ps.setInt(20, sc.getStaffid());
		            
		            ps.setDate(21,sc.getScheduleDate_3());
		            ps.setString(22, sc.getScheduleTime_3());
		            ps.setInt(23,sc.getSpeakerId_3());
		            ps.setInt(24, sc.getTopicId_3());
		            ps.setInt(25, sc.getStaffid());
         
		            ps.setDate(26,sc.getScheduleDate_3());
		            ps.setString(27, sc.getScheduleTime2_3());
		            ps.setInt(28, sc.getSpeakerId2_3());
		            ps.setInt(29, sc.getTopicId2_3());
		            ps.setInt(30, sc.getStaffid());
           
		            ps.setDate(31,sc.getScheduleDate_4());
		            ps.setString(32, sc.getScheduleTime_4());
		            ps.setInt(33,sc.getSpeakerId_5());
		            ps.setInt(34, sc.getTopicId_4());
		            ps.setInt(35, sc.getStaffid());
	            
		            ps.setDate(36,sc.getScheduleDate_4());
		            ps.setString(37, sc.getScheduleTime2_4());
		            ps.setInt(38, sc.getSpeakerId2_4());
		            ps.setInt(39, sc.getTopicId2_4());
		            ps.setInt(40, sc.getStaffid());
		            
		            ps.setDate(41,sc.getScheduleDate_5());
		            ps.setString(42, sc.getScheduleTime_5());
		            ps.setInt(43,sc.getSpeakerId_5());
		            ps.setInt(44, sc.getTopicId_5());
		            ps.setInt(45, sc.getStaffid());
		            
		            ps.setDate(46,sc.getScheduleDate_5());
		            ps.setString(47, sc.getScheduleTime2_5());
		            ps.setInt(48, sc.getSpeakerId2_5());
		            ps.setInt(49, sc.getTopicId2_5());
		            ps.setInt(50, sc.getStaffid());
		            
		            ps.setDate(51,sc.getScheduleDate_6());
		            ps.setString(52, sc.getScheduleTime_6());
		            ps.setInt(53,sc.getSpeakerId_6());
		            ps.setInt(54, sc.getTopicId_6());
		            ps.setInt(55, sc.getStaffid());
		            
		            ps.setDate(56,sc.getScheduleDate_6());
		            ps.setString(57, sc.getScheduleTime2_6());
		            ps.setInt(58, sc.getSpeakerId2_6());
		            ps.setInt(59, sc.getTopicId2_6());
		            ps.setInt(60, sc.getStaffid());
		            
		            ps.setDate(61,sc.getScheduleDate_7());
		            ps.setString(62, sc.getScheduleTime_7());
		            ps.setInt(63,sc.getSpeakerId_7());
		            ps.setInt(64, sc.getTopicId_7());
		            ps.setInt(65, sc.getStaffid());
		
		            ps.setDate(66,sc.getScheduleDate_7());
		            ps.setString(67, sc.getScheduleTime2_7());
		            ps.setInt(68, sc.getSpeakerId2_7());
		            ps.setInt(69, sc.getTopicId2_7());
		            ps.setInt(70, sc.getStaffid());

	         
	            out.println(ps);
	            ps.executeUpdate();
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    public boolean deleteSchedule(int id) throws SQLException {
	        boolean rowDeleted;
	        try (Connection connection = getConnection();
	             PreparedStatement statement = connection.prepareStatement("delete from schedule where scheduleid=?");) {
	            statement.setInt(1, id);
	            rowDeleted = statement.executeUpdate() > 0;
	        }
	        return rowDeleted;
	    }
	    public boolean updateSchedule(Schedule sc) throws SQLException {
	        boolean rowUpdated;
	        try (Connection connection = getConnection();
	             PreparedStatement ps = connection.prepareStatement("update schedule set scheduledate=?,speakerid=?,topicid=? where scheduleid=?");) {

	        	ps.setDate(1, sc.getScheduleDate());
	        	ps.setInt(2,sc.getSpeakerId());
		        ps.setInt(3, sc.getTopicId());
	        	ps.setInt(4, sc.getId());
	            rowUpdated = ps.executeUpdate() > 0;
	        }
	        return rowUpdated;
	    }
}

