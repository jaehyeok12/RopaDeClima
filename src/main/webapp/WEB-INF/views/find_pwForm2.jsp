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
	<form action="pwUpdate">
		<table>
			<tr>
				<td>
					<h4>새로운 비밀번호를 입력해 주세요.</h4>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="newPw"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value="${id}"></td>
			</tr>
			<tr>
				<td><input type="submit" value="완료"></td>
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