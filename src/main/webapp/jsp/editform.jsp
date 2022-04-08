<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="data.Candidate" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Game</title>
</head>
<body>

	<form action='./editgame' method='post'>
		C.ID: <input type='text' name='breed' value='${sessionScope.candidate.id }'><br>
		Last Name: <input type='text' name='weight' value='${sessionScope.candidate.lastName }'><br>
		First Name: <input type='text' name='breed' value='${sessionScope.candidate.firstName }'><br>
		Political Alignment: <input type='text' name='weight' value='${sessionScope.candidate.palign }'><br>
		Home State: <input type='text' name='breed' value='${sessionScope.candidate.state }'><br>
		Age: <input type='text' name='weight' value='${sessionScope.candidate.age }'><br>
		Why?: <input type='text' name='breed' value='${sessionScope.candidate.whyQ }'><br>
		Because: <input type='text' name='weight' value='${sessionScope.candidate.becauseAnswer }'><br>
		<input type="hidden" name="id" value="${sessionScope.candidate.id}">		
		<input type='submit' name='ok' value='Edit'>
	</form>

</body>
</html>

