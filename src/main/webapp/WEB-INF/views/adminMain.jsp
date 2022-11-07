<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>관리자 메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
/*사이드바*/
/* 사이드바 래퍼 스타일 */
body {
	margin: 0px;
	padding: 0px;
}

#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 100%;
	margin-left: -250px;
	background: #000;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 5px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	font-size: 12px;
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

#divRep {
	width: 50%;
	background-color: #ddd;
}

#divNotice {
	width: 50%;
	background-color: #ddd;
}

hr {
	margin: 0px;
}

<!--
-->
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

.row.content {
	height: 450px
}

.sidenav {
	padding-top: 5px;
	background-color: #f1f1f1;
	height: 100%;
}

footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

div .navbar-header {
	background-color: white;
	width: 200px;
	height: 50px;
}

div .navbar-brand {
	padding: 0px;
	margin: 0px;
}

div .row {
	height: 300px;
}

div .col-sm-4 {
	width: 45%;
	text-align: center;
}

div .col-sm-8 {
	width: 45%;
	text-align: center;
}

.table{
	width: 540px;
	max-width:540px;
	text-align: center;
}
tr{
width: 540px;
}
th, td{
	width: 180px;
}
@media screen and (max-width: 1500px){
.table{
	width: 270px;
	max-width:250px;
	text-align: center;
}
tr{
width: 270px;
}
th, td{
	width: 90px;
}

}
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 200px;
	height: 100%;
	background: #000;
}

#page-content-wrapper {
	width: 100%;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img
					src="resources/logos/logo.png" style="width: 200px; height: 50px;" /></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- body -->
	<div class="container-fluid text-center"></div>
	<div id="page-wrapper">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"></a></li>
				<hr />
				<li><a href="#">메인화면t</a></li>
				<hr />
				<li><a href="#">유저 리스트</a></li>
				<hr />
				<li><a href="#">게시물 리스트</a></li>
				<hr />
				<li><a href="#">신고 처리 결과 리스트</a></li>
				<hr />
				<li><a href="#">공지 전송</a></li>
				<hr />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<hr />
				<li><a href="#">최고 관리자</a></li>

			</ul>
		</div>
		<!-- /사이드바 -->

		<!-- 본문 -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="container">


					<div class="row" id="divProfile">
						<div class="col-sm-4" style="width: 200px; height: 200px;">
							<img src="resources/testphotos/photo.jpg"
								style="width: 200px; height: 200px;" />
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<h4>
								관리자 님
								</h2>
								<h4>
									<strong>권한:</strong> 관리자
								</h4>
								<br />
								<hr />
								<br />
						</div>
					</div>
				</div>
				<hr />


				<div class="row" id="adminRepAndNotice">
					<div class="col-sm-4">
						<h4>최근 신고 리스트</h4>
						<table class="table" id="adminRepTable">
							<tr>
								<th>신고자</th>
								<th>신고사유</th>
								<th>신고날짜</th>

							</tr>
							<tbody id="report">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>

						</table>
					</div>

					<div class="col-sm-8" style="margin: 0px 10px; ">
						<h4>최근 공지 리스트</h4>
						<table class="table" id="adminNoticeTable">
							<tr>
								<th>공지번호</th>
								<th>작성자</th>
								<th>공지날짜</th>
							</tr>
							<tbody id="notice">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>

						</table>
					</div>
				</div>


				<div class="row" id="adminProfile">
					<div class="col-sm-4">
						<h3>최근 가입 유저 리스트</h3>
						<table class="table" id="adminRepTable">
							<tr>
								<th>회원번호</th>
								<th>닉네임</th>
								<th>가입날짜</th>
							</tr>
							<tbody id="recJoin">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>

						</table>
					</div>

					<div class="col-sm-8" style="margin: 0px 10px;">
						<h3>최근 게시물 리스트</h3>
						<table class="table" id="adminRecBoardTable">
							<tr>
								<th>글 번호tt</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
							<tbody id="board">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- body end -->


		<footer class="container-fluid text-center">
			<p>Footer Text</p>
		</footer>
</body>
<script>
//AJAX로 ㄱㄱ
var page=1;

function listshow(page){
	$.ajax({
    	type : 'POST',
		url : 'adminJoin',
		data : {
			page:page
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data.success);
			if (data.success > 0) {
				alert('데이터 조회에 성공했습니다.');
				$('#pagination').twbsPagination({
					startPage:1,//시작 페이지
					totalPages:totalPages,//총 페이지 수
					visiblePages:5,//기본으로 보여질 페이지 수
					onPageClick:function(e,page){//클릭했을 때 실행 내용
						console.log(e);	
						console.log(page);	
						listCall(page);
					}
				
				});
			} else {
				alert('조회된 데이터가 없습니다.');
			}
		},
		error : function(e) {
			alert('error00');
		}
    });
}

$(document).ready(listshow(page));

</script>
</html>