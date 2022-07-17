<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <sql:setDataSource var="ic" driver="org.postgresql.Driver"
         url="jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und"
         user = "ocetdbspxioaak"
         password="046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e"/>
      <sql:query dataSource="${ic}" var="oc">
         SELECT * from speaker where speakerid>0
      </sql:query>
      <sql:query dataSource="${ic}" var="oe">
         SELECT * from topic where topicid>0
      </sql:query>
<%
    Class.forName("org.postgresql.Driver");
	String dbURL = "jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und";
	String user = "ocetdbspxioaak";
	String pass = "046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e";
    String id=request.getParameter("id");
    int num=Integer.parseInt(id);
    String sql= "select * from schedule join speaker using(speakerid) join topic using (topicid) where scheduleid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>

<%@include file="navbar.jsp"%>

<div class="content">
    <br>
    <h2>PENCERAMAH</h2>
    <div class="custform">
        <form class="speaker" method="post">
            <input type="hidden" name="id" value='<%=rs.getString("scheduleid") %>'/>
            <div class="dataa">
                <label>   Tarikh </label>
                <input type="date" name="scDate"  value='<%=rs.getString("scheduledate") %>' >
            </div>
            <div class="dataa">
                <label>  Masa</label>
                <input type="text" name="scTime" value='c' disabled>
            </div>
            <div class="dataa">
            <label>  Penceramah</label>
                	<select name="scSpeaker">
                           <option value="<%=rs.getString("speakerid") %>"><%=rs.getString("speakername") %></option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
            </div>
            <div class="dataa">
            <label>  Tajuk</label>
                	<select name="scTopic">
                           <option value=<%=rs.getString("topicid") %>"><%=rs.getString("topicname") %></option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
            </div>
            <%} %>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="ScheduleServlet">BATAL</button>
                <input type="hidden" name="action" value="updateSchedule">
                <button type="submit" formaction="ScheduleServlet" onclick="return confirm('Yakin untuk simpan ?');">KEMASKINI</button>
                <br><br>
            </div>
        </form>
    </div>
</div>

</body>
</html>