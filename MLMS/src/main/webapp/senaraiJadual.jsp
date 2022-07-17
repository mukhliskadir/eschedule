<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="JS/searchTable.js"></script>
  
</head>
<body>

<div id="delete">
         <div class="message">ADAKAH ANDA PASTI UNTUK BUANG?</div><br>
         
         <button type="cancel" class="no">BATAL</button>
         <button type="delete" class="yes">BUANG</button>
      </div>
      
     <sql:setDataSource var="ic" driver="org.postgresql.Driver"
         url="jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und"
         user = "ocetdbspxioaak"
         password="046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e"/>

<sql:query dataSource="${ic}" var="oc">
select row_number() over (order by scheduleid)  "rank",scheduleid,scheduledate,scheduletime,speakername,topicname
from schedule 
LEFT join speaker 
using (speakerid)
LEFT join topic
using(topicid)

</sql:query>
  

<%@include file="navbar.jsp"%>

<div class="content" >

	
  <br>
  <h2>JADUAL</h2>		


  		<div id="mybutton" class="button">
  			<button class="add" type="add" value="add" onclick="location.href='Jadual.jsp'">TAMBAH</button>
  		</div>

  <input type="date" id="myInput" placeholder="Pilih Tarikh"   onfocus="(this.type='date')" onblur="(this.type='text')">   
  <input type="submit" onclick="cariJadual()" >    
  <div style="overflow-x:auto;">
  <table style="text-align: center;" id="listJadual">

	<tr>
      <th onclick="susunJadual(0)" style="width: 50px; height: 50px;">No.</th>
      <th onclick="susunJadual(1)" style="width:300px;">Tarikh</th>
      <th onclick="susunJadual(2)" style="width: 300px;">Waktu Kuliah</th>
      <th onclick="susunJadual(3)" style="width: 450px;">Penceramah</th>
            <th onclick="susunJadual(4)" style="width: 450px;">Tajuk</th>
      <th style="width: 100px; border:0px;opacity:0%">Action</th>
    </tr>
	
	<c:forEach var="result" items="${oc.rows}">
                  <tr>
                  	 <td class="no">
                        <c:out value="${result.rank}"/>
                     </td>
                     <td class="no">
                        <c:out value="${result.scheduledate}"/>
                     </td>
                     <td class="name">
                        <c:out value="${result.scheduletime}"/>
                     </td>
                     <td class="no">
                        <c:out value="${result.speakername}"/>
                     </td>
                     <td class="id">
                        <c:out value="${result.topicname}"/>
                     </td>
                       <td style="border:0px">
                        <form method="post">
                           <button  class="action"  type="edit" formaction="editSchedule.jsp?id=${result.scheduleid}"
                              >KEMASKINI
                           </button>
                        </form>
                        </td>
				</tr>
	</c:forEach>
  </table>
</div>

  		  	
<br><br><br>

  
</div>
<style type="text/css">
  h3{color: black;}
  #myInput{display: inline-block;width: 500px ;}
</style>
<script>
function cariJadual() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("listJadual");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
function susunJadual(n) {
	  var table,
	    rows,
	    switching,
	    i,
	    x,
	    y,
	    shouldSwitch,
	    dir,
	    switchcount = 0;
	  table = document.getElementById("listJadual");
	  switching = true;
	  dir = "asc";
	  while (switching) {
	    switching = false;
	    rows = table.getElementsByTagName("TR");
	    for (i = 1; i < rows.length - 1; i++) { 
	      shouldSwitch = false;
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          shouldSwitch = true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      switchcount++;
	    } else {
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}</script>
</body>

</html>