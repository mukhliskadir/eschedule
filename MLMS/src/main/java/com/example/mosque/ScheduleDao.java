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
	                     ("insert into schedule(scheduledate,scheduletime,speakerid,topicid) values(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?),(?,?,?,?)"))
	        {

	            ps.setDate(1,sc.getScheduleDate());
	            ps.setString(2, sc.getScheduleTime());
	            ps.setInt(3,sc.getSpeakerId());
	            ps.setInt(4, sc.getTopicId());
	            ps.setDate(5,sc.getScheduleDate());
	            ps.setString(6, sc.getScheduleTime2());
	            ps.setInt(7, sc.getSpeakerId2());
	            ps.setInt(8, sc.getTopicId2());
	            
	            ps.setDate(9,sc.getScheduleDate_2());
	            ps.setString(10, sc.getScheduleTime_2());
	            ps.setInt(11,sc.getSpeakerId_2());
	            ps.setInt(12, sc.getTopicId_2());
	            ps.setDate(13,sc.getScheduleDate_2());
	            ps.setString(14, sc.getScheduleTime2_2());
	            ps.setInt(15, sc.getSpeakerId2_2());
	            ps.setInt(16, sc.getTopicId2_2());
	            
	            ps.setDate(17,sc.getScheduleDate_3());
	            ps.setString(18, sc.getScheduleTime_3());
	            ps.setInt(19,sc.getSpeakerId_3());
	            ps.setInt(20, sc.getTopicId_3());
	            ps.setDate(21,sc.getScheduleDate_3());
	            ps.setString(22, sc.getScheduleTime2_3());
	            ps.setInt(23, sc.getSpeakerId2_3());
	            ps.setInt(24, sc.getTopicId2_3());
	            
	            ps.setDate(25,sc.getScheduleDate_4());
	            ps.setString(26, sc.getScheduleTime_4());
	            ps.setInt(27,sc.getSpeakerId_5());
	            ps.setInt(28, sc.getTopicId_4());
	            ps.setDate(29,sc.getScheduleDate_4());
	            ps.setString(30, sc.getScheduleTime2_4());
	            ps.setInt(31, sc.getSpeakerId2_4());
	            ps.setInt(32, sc.getTopicId2_4());
	            
	            ps.setDate(33,sc.getScheduleDate_5());
	            ps.setString(34, sc.getScheduleTime_5());
	            ps.setInt(35,sc.getSpeakerId_5());
	            ps.setInt(36, sc.getTopicId_5());
	            ps.setDate(37,sc.getScheduleDate_5());
	            ps.setString(38, sc.getScheduleTime2_5());
	            ps.setInt(39, sc.getSpeakerId2_5());
	            ps.setInt(40, sc.getTopicId2_5());
	            
	            ps.setDate(41,sc.getScheduleDate_6());
	            ps.setString(42, sc.getScheduleTime_6());
	            ps.setInt(43,sc.getSpeakerId_6());
	            ps.setInt(44, sc.getTopicId_6());
	            ps.setDate(45,sc.getScheduleDate_6());
	            ps.setString(46, sc.getScheduleTime2_6());
	            ps.setInt(47, sc.getSpeakerId2_6());
	            ps.setInt(48, sc.getTopicId2_6());
	            
	            ps.setDate(49,sc.getScheduleDate_7());
	            ps.setString(50, sc.getScheduleTime_7());
	            ps.setInt(51,sc.getSpeakerId_7());
	            ps.setInt(52, sc.getTopicId_7());
	            ps.setDate(53,sc.getScheduleDate_7());
	            ps.setString(54, sc.getScheduleTime2_7());
	            ps.setInt(55, sc.getSpeakerId2_7());
	            ps.setInt(56, sc.getTopicId2_7());
	         
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
	             PreparedStatement ps = connection.prepareStatement("update schedule set speakerid=? where topicid=?");) {

	        	ps.setInt(1,sc.getSpeakerId());
		        ps.setInt(2, sc.getTopicId());
	        	ps.setInt(3, sc.getId());
	            rowUpdated = ps.executeUpdate() > 0;
	        }
	        return rowUpdated;
	    }
}

