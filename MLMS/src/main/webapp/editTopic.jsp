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
    String sql= "select * from topic where topicid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>

<%@include file="navbar.jsp"%>

<div class="content">


    <br>
    <h2>TAJUK</h2>



    <div class="custform">
        <form class="speaker" method="post">
            <input type="hidden" name="id" value='<%=rs.getString("topicid") %>'/>

            <div class="dataa">
                <label>   Name </label>
                <input type="text" name="topicName" value='<%=rs.getString("topicname") %>' required>
            </div>
            <div class="dataa">
                <labe> Tema</labe>
                <select name="topicTheme" id="theme" required>
                    <option value='<%=rs.getString("topictheme")%>' ><%=rs.getString("topictheme")%></option>
                    <option value="Sirah">Sirah</option>
                    <option value="Akhlak">Akhlak</option>
                    <option value="Fiqh">Fiqh</option>
                    <option value="Tafsir">Tafsir</option>
                    <option value="Akidah">Akidah</option>
                </select>
            </div>
            <%} %>

            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="TopicServlet">BATAL</button>
                <input type="hidden" name="action" value="updateTopic">
                <button type="submit" formaction="TopicServlet"onclick="return confirm('Yakin untuk simpan ?');">KEMASKINI</button>
                <br><br>
            </div>
        </form>
    </div>


</div>


<br><br><br>





</body>
<script type="text/javascript">{var dt = new Date();
    document.getElementById("datetime").innerHTML = dt.toLocaleString();}

function functionAlert(msg, myYes) {

    var confirmBox = $("#confirm");
    confirmBox.find(".message").text(msg);
    confirmBox.find(".yes").unbind().click(function() {
        alert("Success! Changes has been saved succesfully!");
        window.location.href = "cth.html";
        confirmBox.hide();
    });
    confirmBox.find(".no").unbind().click(function() {
        confirmBox.hide();
    });
    confirmBox.find(".yes").click(myYes);
    confirmBox.show();}

</script>
<style type="text/css">
    h3{color: black;}
    #myInput{display: inline-block;width: 500px ;}

</style>
</html>