<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="data.Candidate" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>
<tr>
	<th>C.ID</th>
	<th>Last Name</th>
	<th>First Name</th>
	<th>Political Alignment</th>
	<th>Home State</th>
	<th>Age</th>
	<th>Why?</th>
	<th>Because</th>
</tr>

<c:forEach var="candidate" items="${sessionScope.allcandidates }">
	<tr>
		<td>${candidate.id}</td>
		<td>${candidate.lastName}</td>
		<td>${candidate.firstName}</td>
		<td>${candidate.palign}</td>
		<td>${candidate.state}</td>
		<td>${candidate.age}</td>
		<td>${candidate.whyQ}</td>
		<td>${candidate.becauseAnswer}</td>
		
		 <%-- <a href="/editgame?id=${candidate.id}">Edit</a> --%> 
	</tr>
</c:forEach>
</table>

</body>
</html>