<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<%@include file="database.jsp"%>
<%@include file="navbar.jsp"%>


<body>

<div class="content" ><br>

    <h2>TAJUK</h2>
 
<!------------------------------------SEARCH BAR--------------------------------------------->

<select name="topicTheme" id="myInput" >
    <option value="" 		 >Pilih Tema...	</option>
    <option value="Sirah"	 >Sirah			</option>
    <option value="Akhlak"	 >Akhlak		</option>
    <option value="Fiqh"	 >Fiqh			</option>
    <option value="Tafsir"	 >Tafsir		</option>
    <option value="Akidah"	 >Akidah		</option>
    <option value="Lain-lain">Lain-lain		</option>
</select>

<input type="button" class="tajuk" onclick="cariTajuk()" value="Cari" >
    
<!-----------------------------------TABLE HEADER----------------------------------------------->

<div style="overflow-x:auto;">
	<table id="listTajuk">
		<tr>
			<th onclick="susunTajuk(0)" style="width: 80px; height: 50px;">⥯ No.</th>
			<th onclick="susunTajuk(1)" style="width:700px;">⥯ Tajuk</th>
			<th onclick="susunTajuk(2)" style="width: 250px;">⥯ Tema</th>
			<th style="width: 100px;">Tindakan</th>
		</tr>
		
<!-----------------------------------TABLE DATA----------------------------------------------->

		<c:forEach var="data" items="${topic.rows}">
			<tr>
				<td>${data.rank}</td>
				<td>${data.topicname}</td>
				<td>${data.topictheme}</td>
				<td>
					<form method="post">
						<button class="action" type="edit" formaction="editTopic.jsp?id=${data.topicid}">KEMASKINI </button>
					</form>
					<form method="post" id="form_id">
						<input type="hidden" name="topics" id="id" value="${data.topicid}">
						<input type="hidden" name="action" value="deleteTopic">
						<button class="action" type="delete" onclick="deleteTopic()">BUANG</button>
					</form>
				</td>
			</tr>
		</c:forEach>
<!------------------------------------------------------------------------------------------->
	</table>
</div>
</div>

<!--------------------------------------ADD BUTTON---------------------------------------------->

<div id="mybutton" class="button">
	<button class="add" type="add" value="add" onclick="location.href='addTopic.jsp'">TAMBAH</button>
</div>

<!--------------------------------------CONFIRM ALERT------------------------------------------->

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