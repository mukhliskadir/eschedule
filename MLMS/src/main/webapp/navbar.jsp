
<head>
    
<!-------------------------------CSS------------------------------------------------->

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/confirmAlert.css">
     <link rel="stylesheet" href="css/schedule.css">
     
<!-------------------------------SCRIPT------------------------------------------------->

 	 <script src="JS/script.js"></script>
    <script src="JS/sortTable.js"></script>
    <script src="JS/searchTable.js"></script>
    <script src="JS/confirmAlert.js"></script>
    
<!-------------------------------WEB JS------------------------------------------------->

    <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
</head>
<body>

<%Object name = session.getAttribute("staffname"); %>

<!-------------------------------SIDEBAR------------------------------------------------->

<div class="sidebar">
    <div class="img"><img src="${pageContext.servletContext.contextPath }/StaffServlet?id=<%=session.getAttribute(" staffid ")%>"style="width:120px;height: 120px; margin-top: 50px;margin-left: 40px;border-radius: 50%;border: 2px solid black;">
    </div>
        <div class="profname" style="margin-left: 10px;margin-top: -35px;font-weight: bold;font-size: 20px;margin-bottom: 20px;margin-right: 30px;text-align:center;">
            <%=name %>
        </div>

        <form>
            <button type="logout" formaction="viewStaff.jsp" style="margin-left: 40px;margin-bottom: 40px;">URUS AKAUN</button>
        </form>

        <a href="viewSpeaker.jsp" onclick='func()'><i class="fa-solid fa-user"></i>  Penceramah</a>
        <a href="topic"><i class="fa-solid fa-moon"></i>  Tajuk</a>
        <a href="addSchedule.jsp"><i class="fa-solid fa-calendar-days"></i>  Jadual</a>
        <a href="viewAnnouncement.jsp"><i class="fa-solid fa-volume-high"></i> Pengumuman</a>
        <form method="get" action="LoginServlet">
            <input type="hidden" name="action" value="logout">
            <button id="logot" type="logout" onclick="return confirm('Yakin untuk keluar?')">LOG KELUAR</button>
        </form>
</div>
<!--------------------------------HEADER------------------------------------------------>

<div class="header" style="">
    <img src="IMG/logo.png" style="width: 500px;height: 90px; float: left;margin-left: 270px ;">
    <h3 style="color:black;">Waktu: <h7 id="hari"></h7> <span id="datetime"></span></h3>
</div>
</body>

<!-------------------------------SCRIPT------------------------------------------------->

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(function($) {
	  let url = window.location.href;
	  $('.sidebar a').each(function() {
	    if (this.href === url) {
	      $(this).closest('a').addClass('active');
	    }
	  });
	});
    {var dt = new Date();
        document.getElementById("datetime").innerHTML = dt.toLocaleString();
    }
  { const weekday = ["Ahad","Isnin","Selasa","Rabu","Khamis","Jumaat","Sabtu"];

    const d = new Date();
    let day = weekday[d.getDay()];
    document.getElementById("hari").innerHTML = day;}
    
    {
    
    	var loadFile = function(event) {
    		var image = document.getElementById('output');
    		image.src = URL.createObjectURL(event.target.files[0]);
    	};
    }
</script>
