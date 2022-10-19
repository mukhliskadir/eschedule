<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html> 

<%@include file="database.jsp"%>
<%@include file="navbar.jsp"%>

<body>

<div class="content" ><br>

    <h2>PENCERAMAH</h2>
    
<!----SEARCH BAR----->
    
<input type="text" id="myInput" onkeyup="cariPenceramah()" placeholder="Cari penceramah.." title="Type in a name">

<!----TABLE HEADER---->
    
<div style="overflow-x:auto;">
        <table style="text-align: center;" id="listPenceramah">
            <tr>
                <th onclick="sortTable(0)" style="width: 80px; height: 50px;">⥯ No.</th>
                <th onclick="sortTable(1)" style="width:400px;">⥯ Nama</th>
                <th onclick="sortTable(2)" style="width: 300px;">⥯ No. Telefon</th>
                <th onclick="sortTable(3)" style="width: 450px;">⥯ Pendidikan</th>
                <th style="width: 100px;">Tindakan</th>
            </tr>

<!---- DATA----->

            <c:forEach var="data" items="${speaker.rows}">
                <tr>
                    <td>${data.rank}</td>
                    <td>${data.speakername}</td>
                    <td>${data.speakerphoneno}</td>
                    <td>${data.speakereducation}</td>
                    <td>

				<!-- ACTION BUTTON  -->
				
	                    <form method="post">
	                        <button  class="action"  type="edit" formaction="editSpeaker.jsp?id=${data.speakerid}"
	                        >KEMASKINI
	                        </button>
	                    </form>
	                    <form method="post">
	                        <input type="hidden" name="speakers" value="${data.speakerid}">
	                        <input type="hidden" name="action" value="deleteSpeaker">
	                        <button  class="action"  type="delete" formaction="SpeakerServlet"  onclick="return confirm('Yakin untuk buang <c:out value="${data.speakername}"/> ?');">BUANG</button>
	                    </form>
                        
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<!-- ADD BUTTON----------------------->

  <div id="mybutton" class="button">
        <button class="add" type="add" value="add" onclick="location.href='addSpeaker.jsp'">TAMBAH</button>
    </div>

<!------CONFIRM ALERT-------->

<div class="confirm">
  <div></div>
  <div>
    <div id="confirmMessage"></div>
    <div>
      <input id="confirmYes" type="button" value="Yes" />
      <input id="confirmNo" type="button" value="No" />
    </div>
  </div>
</div>

</body>
</html>