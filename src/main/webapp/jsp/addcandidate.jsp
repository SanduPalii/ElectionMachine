<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="data.Candidate" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4> Add Candidate</h4>
	<form action='./addcandidate' method="post">
	Last Name: <input type='text' name='lName'><br>
	First Name: <input type='text' name='fName'><br>
	Political Alignment: <input type='text' name='pAlign'><br>
	Home State: <input type='text' name='hState'><br>
	Age: <input type='text' name='cAge'><br>
	Why?: <input type='text' name='whyQuestion'><br>
	Because: <input type='text' name='becauseAnswer'><br>
	
	<a href="/showall.jsp" >Go back</a>
	</form>
</body>
</html>