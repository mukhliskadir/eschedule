<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource 
		var		 ="eschedule" 
		driver   ="org.postgresql.Driver"
		url		 ="jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und"
		user 	 ="ocetdbspxioaak"
		password ="046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e"
/>
         
<sql:query dataSource="${eschedule}" var="topic">
    SELECT row_number() over (order by topicid desc)"rank",topicid,topicname,topictheme 
    FROM topic
    WHERE topicid>0
</sql:query>

<sql:query dataSource="${eschedule}" var="speaker">
    SELECT row_number() over (order by speakerid)  "rank",speakerid,speakername,speakerphoneno,speakereducation 
    FROM speaker
    WHERE speakerid>0
</sql:query>
