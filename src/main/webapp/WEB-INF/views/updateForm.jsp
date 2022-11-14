<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding :5px 10px;
	}
</style>
</head>
<body>
	<form action="update" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="userId" value="${info.id}" readonly/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="userPass" value="${info.pw}"/></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="userName" value="${info.name}"/></td>
			</tr>
			<tr>
				<th>AGE</th>
				<td><input type="text" name="age" value="${info.age}"/></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td>
					<input type="radio" name="gender" value="남" 
					<c:if test="${info.gender eq '남'}">checked</c:if>/> 남자
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여" 
					<c:if test="${info.gender eq '여'}">checked</c:if>/> 여자
				</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="email" value="${info.email}"/></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="회원가입"/></th>
			</tr>
		</table>
	</form>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>