<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
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
<%
	Class.forName("org.postgresql.Driver");
	String dbURL = "jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und";
	String user = "ocetdbspxioaak";
	String pass = "046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e";
    String id=request.getParameter("id");
    int num=Integer.parseInt(id);
    String sql= "select * from staff left outer join imam using(staffid) where staffid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>


<%@include file="navbar.jsp"%>
<div class="content">
    <br>
    <h2>IMAM</h2>
    <div class="staffform">
        <form class="staff" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value='<%=rs.getString("staffid") %>'/>
            
        	<div class="dataa">
     		<label>   Gambar Profile </label>
        <input type="file"  accept="image/*" name="staffPic" id="file"  onchange="loadFile(event)"  >
   			</div>
            <div class="dataa">
                <label>   Nama </label>
                <input type="text" name="staffName" value='<%=rs.getString("staffname") %>' >
            </div>
            <div class="dataa">
                <label>No Telefon</label>
                <input type="text" name="staffPhone" value='<%=rs.getString("staffphoneno") %>'  pattern="[0-9]{3}-[0-9]{8}">
            </div>
            <div class="dataa">
                <label>Nama pengguna</label>
                <input type="text" name="staffUsername" value='<%=rs.getString("staffusername") %>'>
            </div>
              <div class="dataa">
                <label>Kata Laluan</label>
                <input type="password" name="staffPassword" value='<%=rs.getString("staffpass") %>'>
            </div>
           
            <%} %>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="StaffServlet">BATAL</button>
                <input type="hidden" name="action" value="updateStaff">
                <button type="submit" formaction="StaffServlet" onclick="return confirm('Yakin untuk simpan ?');">SIMPAN</button>
                <br><br>
            </div>
        </form>
    </div>
     <div class="staffform">
 <div class="divposter">
 	<div class="dataa">
      <p><img id="output"  src="${pageContext.servletContext.contextPath }/StaffServlet?id=<%=id %>" style="height:260px;" /></p>
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