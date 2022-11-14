<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<button onclick="logout(${memNum})">로그아웃</button>
	<p>메인 페이지</p>
	안녕하세요 ${sessionScope.loginId} 님.
	<input type="hidden" value="${memNum}">
	
	<form action="post">
		<button type="submit">댓글</button>
	</form>	
</body>
<script>
	function logout(memNum) {
		var tempForm = document.createElement('form');
	    tempForm.setAttribute('method','post');
	    tempForm.setAttribute('action','logout');
	   
	    var mem_num;
	    mem_num = document.createElement('input');
	    mem_num.setAttribute('type', 'hidden');
	    mem_num.setAttribute('name', 'memNum');
	    mem_num.setAttribute('value', memNum);
	   
	    tempForm.appendChild(mem_num)
	   
	    document.body.appendChild(tempForm);
	    tempForm.submit();
	}
	
</script>
</html>







