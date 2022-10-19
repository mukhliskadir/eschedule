<!DOCTYPE html>
<html>
<body>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>
<!------------------------------------------------------------------------------------------->

<div class="content">
    <br>
    <h2>TAJUK</h2>

<!--------------------------------------FORM-------------------------------------------->

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
                    <option value="Lain-lain">Lain-lain</option>
                    
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

</html>