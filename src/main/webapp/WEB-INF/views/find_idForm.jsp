<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	<header>
		
	</header>

		<form action="find_idForm_2" method="post">
	<table>
		<tr>
			<th>이름</th>
			<td colspan="2"><input type="text" name="name" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td colspan="2"><input type="text" name="phone" /></td>
		</tr>
		<tr>
			<th colspan="3">
				<input type="submit" value="이메일 찾기" />
				
				
			</th>
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