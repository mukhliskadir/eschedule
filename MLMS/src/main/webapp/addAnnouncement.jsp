<!DOCTYPE html>
<html>
<body>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>

<!------------------------------------------------------------------------------------------->

<div class="content">
			
	<br>
	<h2>PENGUMUMAN</h2>
	
<!--------------------------------------FORM-------------------------------------------->
	
	<div class="ANNOUNCEMENTFORM">
		<form class="announcement" method="post" action="AnnouncementServlet" enctype="multipart/form-data">
			<div class="dataa">
				<label> Poster </label>
				<input type="file" name="aPicture" id="file" onchange="loadFile(event)"> </div>
			<div class="dataa">
				<label> Topik </label>
				<input type="text" name="aTitle" value=""> </div>
			<div class="dataa">
				<label> Tarikh</label>
				<input type="date" name="aDate" value=""> </div>
			<div class="dataa">
				<label> Masa</label>
			<input type="time" name="aTime" value=""> </div>
			<div class="dataa">
				<label> Maklumat</label>
				<textarea name="aDesc" style="height:200px;"></textarea>
			</div>
			<!--SUBMIT  BUTTON -->
			<div id="mybutton" class="button">
				<input type="hidden" name="action" value="addAnnouncement">
				<button type="submit" class="button button1" name="submit">TAMBAH</button>
				<br>
				<br> </div>
		</form>
	</div>

<!-----------------------------------DISPLAY IMAGE------------------------------------------->

	<div class="ANNOUNCEMENTFORM">
		<div class="divposter">
			<div class="dataa">
				<p><img id="output" style="height:400px;" /></p>
			</div>
		</div>
	</div>

<!------------------------------------------------------------------------------------------->
	
</div>
</body>


</html>