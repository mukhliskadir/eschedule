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
   </head>
   
   <body>
      <div id="delete">
         <div class="message">ADAKAH ANDA PASTI UNTUK BUANG?</div>
         <br>
         <button type="cancel" class="no">BATAL</button>
         <button type="delete" class="yes">BUANG</button>
      </div>
      
    
    
  
      <%@include file="database.jsp"%>
      
      <%@include file="navbar.jsp"%>
      
        <sql:query dataSource="${eschedule}" var="oc">
         SELECT row_number() over (order by announcementid)   "rank",announcementpicture,announcementid,announcementtitle,announcementdesc,to_char(announcementdate,'YYYY-MM-DD')"announcementdate",announcementtime,announcementstatus from announcement
      </sql:query>
      <div class="content" ><br>
      
         <h2>PENGUMUMAN</h2>
         
         <div id="mybutton" class="button">
            <button class="add" type="add" value="add" onclick="location.href='addAnnouncement.jsp'">TAMBAH</button>
         </div>
         
     
         <div style="overflow-x:auto;">
            
            <table style="text-align: center;" id="listPenceramah">
               <tr>
                  <th onclick="sortTable(0)" style="width: 80px; height: 50px;">No.</th>
                  <th onclick="sortTable(1)" style="width:400px;">Gambar</th>	
                  <th onclick="sortTable(2)" style="width: 350px;">Tajuk</th>
                  <th onclick="sortTable(2)" style="width: 460px;">Deskripsi</th>
                  <th onclick="sortTable(4)" style="width: 250px;">Tarikh & Masa</th>
                  <th onclick="sortTable(4)" style="width: 250px;">Status</th>
                  <th style="width: 100px;">Action</th>
               </tr>
               
               <c:forEach var="result" items="${oc.rows}">
                  <tr>
                     <td class="no">
                        <c:out value="${result.rank}"/>
                     </td>
                     <td class="name">
            			<img style="width:300px;height:150px;" src="${pageContext.servletContext.contextPath }/AnnouncementServlet?id=${result.announcementid}" />
						</td>
                     <td class="no">
                        <c:out value="${result.announcementtitle}"/>
                     </td>
                     <td class="id">
                        <c:out value="${result.announcementdesc}"/>
                     </td>
                     <td class="id">
                     	Tarikh	:
                        <c:out value="${result.announcementdate}"/>
                        <br>
                        Masa	:
                        <c:out value="${result.announcementtime}"/>
                     </td>
                      <td class="id">
                        <c:out value="${result.announcementstatus}"/>
                     </td>
                     <td>
                        <form method="post">
                           <button  class="action"  type="edit" formaction="editAnnouncement.jsp?id=${result.announcementid}"
                              >KEMASKINI
                           </button>
                        </form>
                        
                        <form method="post">
                           <input type="hidden" name="aId" value="${result.announcementid}">
                           <input type="hidden" name="action" value="deleteAnnouncement">
 
                           <button id="complexConfirm" class="action"  type="delete" formaction="AnnouncementServlet" onclick="return confirm('Yakin untuk buang?')">BUANG</button>
                        </form>
                     </td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <br><br><br>
      </div>
      <style>
         h3{color: black;}
         #myInput{display: inline-block;width: 500px ;}
      </style>
      <script>
      if (document.getElementById) {
          // Swap the native alert for the custom
          // alert
          window.alert = function (alert_message) {
              deleteAlert(msg,myYes);
          }
      }
      function deleteAlert(msg, myYes) {
          
          var confirmBox = $("#delete");
          confirmBox.find(".message").text(msg);
          confirmBox.find(".yes").unbind().click(function() {
             confirmBox.hide();
          });
          confirmBox.find(".no").unbind().click(function() {
             confirmBox.hide();
          });
          confirmBox.find(".yes").click(myYes);
          confirmBox.show();}
    
      $("#complexConfirm").confirm({
    	    title:"Delete confirmation",
    	    text:"This is very dangerous, you shouldn't do it! Are you really really sure?",
    	    confirm: function(button) {
    	        alert("You just confirmed.");
    	    },
    	    cancel: function(button) {
    	        alert("You aborted the operation.");
    	    },
    	    confirmButton: "Yes I am",
    	    cancelButton: "No"
    	});
      </script>
   </body>
</html>