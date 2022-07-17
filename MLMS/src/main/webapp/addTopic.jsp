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
    <h2>TAJUK</h2>
    <div class="topicform">
        <form class="speaker" method="post" action="TopicServlet">
            <div class="dataa">
                <label>   Tajuk </label>
                <input type="text" name="topicName" value="" required oninvalid="this.setCustomValidity('Sila masukkan nama tajuk')" oninput="setCustomValidity('')">
            </div>
            <div class="dataa">
                <labe> Tema</labe>
                <select name="topicTheme" id="theme" required>
                    <option value="" disabled selected hidden>Pilih Tema...</option>
                    <option value="Sirah">Sirah</option>
                    <option value="Akhlak">Akhlak</option>
                    <option value="Fiqh">Fiqh</option>
                    <option value="Tafsir">Tafsir</option>
                    <option value="Akidah">Akidah</option>
                </select>
            </div>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="TopicServlet">BATAL</button>
                <input type="hidden" name="action" value="addTopic">
                <button type="submit" class="button button1" name="submit" >TAMBAH</button><br><br>
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