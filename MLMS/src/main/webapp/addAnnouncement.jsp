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


 <%@include file="navbar.jsp"%>

<div class="content">

  
  <br>
  <h2>PENGUMUMAN</h2>   

 
        	
      <div class="ANNOUNCEMENTFORM">
  <form class="announcement" method="post" action="AnnouncementServlet" enctype="multipart/form-data">
  	
 
    <div class="dataa">
     <label>   Poster </label>
        <input type="file"  name="aPicture" id="file"  onchange="loadFile(event)" >
    </div>
    <div class="dataa">
     <label>   Topik </label>
        <input type="text" name="aTitle" value="">
    </div>
    <div class="dataa">
    <label>    Tarikh</label>
        <input type="date" name="aDate" value="">
    </div>
    <div class="dataa">
    <label>    Masa</label>
     	<input type="time" name="aTime" value="">
    </div>
    <div class="dataa">
      <label>  Maklumat</label>
        <textarea name="aDesc" style="height:200px;" ></textarea>
    </div>
    
     <div id="mybutton" class="button">  
 <input type="hidden" name="action" value="addAnnouncement">    	
    <button type="submit" class="button button1" name="submit" >TAMBAH</button><br><br>
    </div>
</form>
      </div>
         <div class="ANNOUNCEMENTFORM">
 <div class="divposter">
 	<div class="dataa">
      <p><img id="output" style="height:400px;" /></p>
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
  .ANNOUNCEMENTFORM{display:inline-block;}
  .divposter{padding:1px;background-color:#ffe0b3;height:440px;width:660px; box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);}
  #output{max-width:600px;}
</style>
</html>