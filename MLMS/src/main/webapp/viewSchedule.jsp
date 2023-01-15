<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<!-------------------GET PARAMETER FROM SEARCH (addSchedule.jsp)----------------------------->
 <%
 String startDate = request.getParameter("fDate");
 String toDate = request.getParameter("tDate");
 %>
<!------------------------------DATABASE CONNECTION ----------------------------------------->
 
<sql:setDataSource 
		var		 ="eschedule" 
		driver   ="org.postgresql.Driver"
		url		 ="jdbc:postgresql://ep-winter-moon-258448.ap-southeast-1.aws.neon.tech/neondb"
		user 	 ="mukhliskadir"
		password ="NGx9KZVkQ3am"
/>
<sql:query dataSource="${eschedule}" var="schedule">
	SELECT scheduleid,scheduledate,scheduletime,speakername,topicname,topictheme 
	FROM schedule s 
	JOIN speaker q 
	on s.speakerid = q.speakerid 
	JOIN topic t 
	on s.topicid = t.topicid 
	WHERE scheduledate >= '<%=startDate%>' 
	AND scheduledate <= '<%=toDate%>' 
	ORDER BY scheduleid 
</sql:query>

<body>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>

<!------------------------------------------------------------------------------------------->

  
  <div class="content" ><br>
    
         <h2><%=startDate %> HINGGA <%=toDate %></h2>
         
<!-----------------------------------TABLE HEADER----------------------------------------------->
    
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

<!-----------------------------------TABLE DATA----------------------------------------------->

<c:forEach var="result" items="${schedule.rows}">
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
          
<!-------------------------------------TO EDIT BUTTON---------------------------------------------->
          
<div id="mybutton" class="button">
  <form ><button    type="submit" formaction="senaraiJadual.jsp">UBAH JADUAL</button></form>
</div>
</div>


</body>
<style>
tr{width:30px;}
</style>


</html>