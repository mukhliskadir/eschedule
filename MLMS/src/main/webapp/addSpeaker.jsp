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
    <h2>PENCERAMAH</h2>
    <div class="custform">
        <form class="speaker" method="post" action="SpeakerServlet">
            <div class="dataa">
                <label>   Nama </label>
                <input type="text" name="speakerName" value="" required oninvalid="this.setCustomValidity('Sila masukkan nama')" oninput="setCustomValidity('')">
            </div>
            <div class="dataa">
                <label>  No. Telefon</label>
                <input type="text" name="speakerPhone" value="" placeholder="012-3456790" pattern="[0-9]{3}-[0-9]{8}">
            </div>
            <div class="dataa">
                <label>    Pendidikan</label>
                <input type="text" name="speakerEdu" value="">
            </div> 
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="SpeakerServlet">BATAL</button>
                <input type="hidden" name="action" value="addSpeaker">
                <button type="submit" class="button button1" name="submit" >TAMBAH</button><br><br>
            </div>
        </form>
    </div>
</div>
<br><br><br>
</body>


</html>