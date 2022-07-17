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
<sql:setDataSource var="MLMS" driver="org.postgresql.Driver"
         url="jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und"
         user = "ocetdbspxioaak"
         password="046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e"/>
         
      <sql:query dataSource="${MLMS}" var="staff">
         SELECT * from staff
      </sql:query>

<%@include file="navbar.jsp"%>
<div class="content">
    <br>
    <h2>URUS AKAUN</h2>
    <div class="staffform">
        <form class="staff" method="post" action="StaffServlet"  enctype="multipart/form-data">
        	<div class="dataa">
     		<label>   Gambar Profil </label>
       			 <input type="file"  name="staffPic" id="file"  onchange="loadFile(event)" >
   			</div>
            <div class="dataa">
                <label>   Nama </label>
                <input type="text" name="staffName" value="" >
            </div>
            <div class="dataa">
                <label>No Telefon</label>
                <input type="text" name="staffPhone" placeholder="012-3456790" pattern="[0-9]{3}-[0-9]{8}">
            </div>
            <div class="dataa">
                <label>Nama pengguna</label>
                <input type="text" name="staffUsername" value="">
            </div>
              <div class="dataa">
                <label>Kata Laluan</label>
                <input type="password" name="staffPassword" value="">
            </div>
            <div class="dataa">
                <label>Jawatan</label>
					<select id="select" name="staffRole">
					<option value="Imam">Imam</option>
					<option value="AJK">Ahli Jawatankuasa</option>
					<option value="AJK Multimedia">AJK Multimedia</option>
					
					</select>
			</div>
			<div class="dataa">
                <label>Penyelia</label>
					<select name="supervisor">
                           <option value="0">Pilih Penyelia...</option>
                           <c:forEach var="result" items="${staff.rows}">
                              <option value="${result.staffid}">${result.staffname},${result.staffrole}</option>
                           </c:forEach>
                    </select>
			</div>
		
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="StaffServlet">BATAL</button>
                <input type="hidden" name="action" value="addStaff">
                <button type="submit" class="button button1" name="submit" >TAMBAH</button><br><br>
            </div>
        </form>
    </div>
     <div class="staffform">
 <div class="divposter">
 	<div class="dataa">
      <p><img id="output" style="height:260px;" /></p>
    </div>
      </div>
      </div>
</div>
<br><br><br>
</body>
<script type="text/javascript">

var loadFile = function(event) {
	  var image = document.getElementById('output');
	  image.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
<style type="text/css">
  h3{color: black;}
  #myInput{display: inline-block;width: 500px ;}
  .staffform{display:inline-block;}
  .divposter{padding:1px;background-color:#ffe0b3;height:300px;width:300px; box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);}
  #output{max-width:600px;}
</style>
</html>