<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0 auto;
	}

	header{
		width: 100%;
		height: 100px;
		background: #ccc;	
	}
	table{
	    margin-top: 180px;
	    width: 500px;
	    height: 300px;
	    text-align: center;
	    border: 1px solid #ccc;
}
	
	input [type="text"]{
		width: 500px;
		height: 10px;
	}
</style>
</head>
<body>
	<header></header>
	<form action="find_pwForm_2">
	<table>
		<tr>
			<th>이름</th>
			<td> <input type="text" name="name"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td> <input type="text" name="id"></td>
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="비밀번호 찾기"></td>
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