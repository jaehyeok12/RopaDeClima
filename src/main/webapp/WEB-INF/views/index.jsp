<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style></style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<body>
	<form action="login" method="post">
		<table>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" name="pw" /></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="LOGIN"/>
				<input type="button" value="회원가입" onclick="location.href='joinForm'"/>
			</th>
		</tr>
	</table>	
	</form>
</body>
<script></script>
</html>