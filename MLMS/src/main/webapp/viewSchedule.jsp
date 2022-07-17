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
         <%@include file="navbar.jsp"%>
   
   
 <%
 Class.forName("org.postgresql.Driver");
	String dbURL = "jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und";
    String user = "ocetdbspxioaak";
    String pass = "046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e";
 
 String startDate = request.getParameter("fDate");
 String toDate = request.getParameter("tDate");
 Connection con=DriverManager.getConnection(dbURL, user, pass);
 Statement stmt = con.createStatement();
 String sql= "select scheduleid,scheduledate,scheduletime,speakername,topicname,topictheme from schedule s join speaker q on s.speakerid = q.speakerid join topic t on s.topicid = t.topicid where scheduledate >= TO_DATE('"+startDate+"','YYYY-MM-DD') AND scheduledate <= TO_DATE('"+toDate+"','YYYY-MM-DD') order by scheduleid ";
 %>
 <sql:setDataSource var="ic" driver="org.postgresql.Driver"
         url="jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und"
         user = "ocetdbspxioaak"
         password="046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e"/>
<sql:query dataSource="${ic}" var="oc">
	 <%=sql %>
</sql:query>

  <div class="content" ><br>
    
         <h2><%=startDate %> HINGGA <%=toDate %></h2>
         
          
  <div style="overflow-x:auto;">
 
<table id="main">
	<tbody>
		<tr>
			<th style="height:20px;width:100px;">HARI</th>
			<td rowspan="8" style="padding:0px;">
			<table style="text-align: center; margin:0px;width:100%;" id="kuliah">
               <tr>
                <th style="width: 15%;">WAKTU</th>
               	<th style="width: 35%;">PENCERAMAH</th>
               	<th style="width: 40%;">TAJUK</th>
               	<th style="width: 10%;">TEMA</th>
               
               </tr>

<c:forEach var="result" items="${oc.rows}">
                  <tr>
                  	<c:if test="${result.scheduletime=='Dhuha'}">
    				  <td style="background-color: #e6ffcc;">${result.scheduletime}</td>
					</c:if>
					<c:if test="${result.scheduletime=='Maghrib'}">
    				  <td style="background-color: #b3ffff;">${result.scheduletime}</td>
					</c:if>
					
					<!--   -->
					
                     <td >
                        <c:out value="${result.speakername}"/>
                     </td>
                     <td >
                        <c:out value="${result.topicname}"/>
                     </td>
                     <!--   -->
                     
                     <c:if test="${result.topictheme=='Fiqh'}">
     						 <td style="background-color: #ffb3d9;">${result.topictheme}</td>
					</c:if>
					 <c:if test="${result.topictheme=='Akhlak'}">
     						 <td style="background-color: #ffc6b3;">${result.topictheme}</td>
					</c:if>
					 <c:if test="${result.topictheme=='Sirah'}">
     						 <td style="background-color: #e0e0d1;">${result.topictheme}</td>
					</c:if>
					 <c:if test="${result.topictheme=='Tafsir'}">
     						 <td style="background-color: #ffccff;">${result.topictheme}</td>
					</c:if>
					 <c:if test="${result.topictheme=='Akidah'}">
     						 <td style="background-color: #c2c2f0;">${result.topictheme}</td>
					</c:if>
					 <c:if test="${result.topictheme=='-'}">
     						 <td style="background-color: black;">${result.topictheme}</td>
					</c:if>
                   </tr>
                   
          </c:forEach>
          </table>
			</td>
		</tr>
		<tr>
			<td style="background-color:#e6e6e6;">AHAD</td>
		</tr>
		<tr>
			<td style="background-color:#bfbfbf;">ISNIN</td>
		</tr>
		<tr>
			<td style="background-color:#e6e6e6;">SELASA</td>
		</tr>
		<tr>
			<td style="background-color:#bfbfbf;">RABU</td>
		</tr>
		<tr>
			<td style="background-color:#e6e6e6;">KHAMIS</td>
		</tr>
		<tr>
			<td style="background-color:#bfbfbf;">JUMAAT</td>
		</tr>
		<tr>
			<td style="background-color:#e6e6e6;">SABTU</td>
		</tr>
	</tbody>
</table>
          </div>
       <div id="mybutton" class="button">
  <form >
   	<button    type="submit" formaction="senaraiJadual.jsp">UBAH JADUAL</button>
   </form>  
   <form method="post" action="ScheduleServlet">
   <input type="hidden" name="fromDate" value="<%=startDate %>"/>
   <input type="hidden" name="toDate" value="<%=toDate %>"/>
   
   	<button    type="delete" name="action" value="deleteSchedule" onclick="return confirm('Yakin untuk buang?')">BUANG</button>
   </form>  
</div>
</div>


</body>
<style>
tr{width:30px;}
</style>

<script type="text/javascript">


</script>
</html>