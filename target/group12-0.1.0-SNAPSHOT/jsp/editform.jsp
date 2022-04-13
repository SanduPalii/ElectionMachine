<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="data.Candidate" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Candidate</title>
</head>
<body>

	<form action='./editcandidate' method='post'>
		Last Name: <input type='text' name='lName' value='${sessionScope.candidate.lastName }'><br>
		First Name: <input type='text' name='fName' value='${sessionScope.candidate.firstName }'><br>
		Political Alignment: <input type='text' name='pAlign' value='${sessionScope.candidate.palign }'><br>
		Home State: <input type='text' name='hState' value='${sessionScope.candidate.state }'><br>
		Age: <input type='text' name='cAge' value='${sessionScope.candidate.age }'><br>
		Why?: <input type='text' name='whyQuestion' value='${sessionScope.candidate.whyQ }'><br>
		Because: <input type='text' name='becauseAnswer' value='${sessionScope.candidate.becauseAnswer }'><br>
		<input type="hidden" name="id" value="${sessionScope.candidate.id}">		
		<input type='submit' name='ok' value='Edit'>
	</form>
</body>
</html>

