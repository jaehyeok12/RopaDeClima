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
		width: 100%px;
		height: 100px;
		background: #ccc;
	}
	div{
		text-align: center;
	}
	.findId{
		margin-top : 100px;
		width : 800px;
		background-color: #ccc;
		height: 300px;
}
	p{
		padding: 100px 0px 30px 0px ; 
	}
</style>
</head>
<body>
	<header></header>


	<div class="findId">
		<p>
			회원님의 이메일은<br> 
			${sessionScope.loginId}<br>
			입니다.
		</p>
			<button type="button" value="로그인하기" onclick="location.href='./'">로그인하기</button> 
			<button type="button" onclick="location.href='find_pw'">비밀번호 찾기</button> 
	</div>

	
</body>
</html>