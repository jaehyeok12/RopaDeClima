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

.table {
	width: 540px;
	max-width: 540px;
	text-align: center;
}

tr {
	width: 540px;
}

th, td {
	width: 180px;
}

@media screen and (max-width: 1500px) {
	.table {
		width: 270px;
		max-width: 250px;
		text-align: center;
	}
	tr {
		width: 270px;
	}
	th, td {
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
				<li style="background-color: white; color: black;"><a href="#">메인화면</a></li>
				<hr />
				<li><a onclick="goUser()">유저 리스트</a></li>
				<hr />
				<li><a onclick="goBoard()">게시물 리스트</a></li>
				<hr />
				<li><a onclick="goRepProc()">신고 처리 결과 리스트</a></li>
				<hr />
				<li><a onclick="goNotice()">공지 전송</a></li>
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

				<div id="Context">
TEST
				</div>
			</div>
		</div>

		<!-- body end -->


		<footer class="container-fluid text-center">
			<p>Footer Text</p>
		</footer>
</body>
<script type="text/javascript">
	//AJAX로 ㄱㄱ
	//var page=1;

	function desList() {
		$.ajax({
			type : 'POST',
			url : 'adminDes',
			data : {},
			dataType : 'JSON',
			success : function(result) {
				console.log(result.resDes);
				if (result.desCnt > 0) {
					alert('데이터 조회에 성공했습니다.');
					createDesTable(result.resDes, result.resDateStrs);
					/*
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
					 */
				} else {
					//alert('조회된 데이터가 없습니다.');
					$("#report").empty();
					$("#report").append(
							"<td colspan=3>" + result.resDes + "</td>");
				}
			},
			error : function(e) {
				alert('error00');
			}
		});
	}
	//관리자 알람
	function admList() {
		$.ajax({
			type : 'POST',
			url : 'adminAdm',
			data : {},
			dataType : 'JSON',
			success : function(result) {
				console.log(result.resAdm);
				if (result.AdmCnt > 0) {
					createNoticeTable(result.resAdm, result.resAdmDates)
					alert('데이터 조회에 성공했습니다.');
					/*
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
					
					 */
				} else {
					//alert('조회된 데이터가 없습니다.');
					$("#notice").empty();
					$("#notice").append(
							"<td colspan=3>공지 : " + result.resAdm + "</td>");
				}
			},
			error : function(e) {
				alert('error00');
			}
		});
	}
	function recJoinList() {
		$.ajax({
			type : 'POST',
			url : 'adminRecJoin',
			data : {},
			dataType : 'JSON',
			success : function(result) {
				console.log(result.resRecJoin);
				if (result.RecJoinCnt > 0) {
					//alert('데이터 조회에 성공했습니다.');
					createRecJoinTable(result.resRecJoin, result.resRecJoinDates);
					/*
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
					 */
				} else {
					//alert('조회된 데이터가 없습니다.');
					$("#recJoin").empty();
					$("#recJoin").append(
							"<td colspan=3>" + result.resRecJoin + "</td>");
				}
			},
			error : function(e) {
				alert('error00');
			}
		});
	}
	function boardList() {
		$.ajax({
			type : 'POST',
			url : 'adminBoard',
			data : {},
			dataType : 'JSON',
			success : function(result) {
				console.log(result.resBoard);
				if (result.desCnt > 0) {
					alert('데이터 조회에 성공했습니다.');
					createBoardTable(result.resBoard, result.resBoardDates);
					/*
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
					 */
				} else {
					//alert('조회된 데이터가 없습니다.');
					$("#board").empty();
					$("#board").append(
							"<td colspan=3>" + result.resBoard + "</td>");
				}
			},
			error : function(e) {
				alert('error00');
			}
		});
	}

	/**
	 function listshow(page){
	 $.ajax({
	 type : 'POST',
	 url : 'adminJoin',
	 data : {
	 page:page
	 },
	 dataType : 'JSON',
	 success : function(data) {
	 console.log(data.res);
	 if (data.desCnt> 0) {
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
	 //alert('조회된 데이터가 없습니다.');
	 $("#report").empty();
	 $("#notice").empty();
	 $("#recJoin").empty();
	 $("#board").empty();
	 $("#report").append("<td colspan=3>"+data.res+"</td>");
	 $("#notice").append("<td colspan=3>"+data.res+"</td>");
	 $("#recJoin").append("<td colspan=3>"+data.res+"</td>");
	 $("#board").append("<td colspan=3>"+data.res+"</td>");
	 }
	 },
	 error : function(e) {
	 alert('error00');
	 }
	 });
	 }
	 * 
	 */
	 function createDesTable(list, dateStrs){
			var content = "";
			for (var i = 0; i < list.length; i++) {
				console.log("게시판 : "+list[i]);
				console.log("게시판 : "+dateStrs[i]);
				content += '<tr>';
				content += '<td>' + list[i].mem_nickname + '</td>';
				content += '<td><a href="detail?mem_num=' + list[i].reason + '">'
						+ list[i].reason + '</td>';
				content += '<td>' + dateStrs[i] + '</td>';
				content += '</tr>';
			}
			$("#report").empty();
			$("#report").append(content);
		}
	 
	 function createNoticeTable(list, dateStrs){
			var content = "";
			for (var i = 0; i < list.length; i++) {
				console.log("공지 : "+list[i]);
				content += '<tr>';
				content += '<td>' + list[i].msg_id + '</td>';
				content += '<td>'
						+ list[i].mem_nickname + '</td>';
				content += '<td>' + dateStrs[i] + '</td>';
				content += '</tr>';
			}
			$("#notice").empty();
			$("#notice").append(content);
		}
	function createRecJoinTable(list,dateStrs) {
		var content = "";
		for (var i = 0; i < list.length; i++) {

			date = new Date(list[i].reg_date);
			console.log(date.toLocaleDateString('ko-KR'))
			console.log(list[i]);
			content += '<tr>';
			content += '<td>' + list[i].mem_num + '</td>';
			content += '<td><a href="detail?mem_num=' + list[i].idx + '">'
					+ list[i].mem_nickname + '</td>';
			content += '<td>' + dateStrs[i] + '</td>';
			content += '</tr>';
		}
		$("#recJoin").empty();
		$("#recJoin").append(content);

	}
function createBoardTable(list, dateStrs){
	var content = "";
	for (var i = 0; i < list.length; i++) {
		console.log("게시판 : "+list[i]);
		content += '<tr>';
		content += '<td>' + list[i].board_num + '</td>';
		content += '<td><a href="detail?mem_num=' + list[i].board_num + '">'
				+ list[i].mem_nickname + '</td>';
		content += '<td>' + dateStrs[i] + '</td>';
		content += '</tr>';
	}
	$("#board").empty();
	$("#board").append(content);
}
	function Main() {
		$('#Context').empty();
		$('#Context').load("resources/jsp/briefInform.jsp");
	}
	
	function goUser() {
		$('#Context').empty();
		$('#Context').load("resources/jsp/adminUserList.jsp");
	}
	
	function goBoard() {
		$('#Context').empty();
		$('#Context').load("resources/jsp/adminBoardList.jsp");
	}
	
	function goRepProc() {
		$('#Context').empty();
		$('#Context').load("resources/jsp/adminRepProcList.jsp");
	}
	
	function goNotice() {
		$('#Context').empty();
		$('#Context').load("resources/jsp/adminSendMsg.jsp");
	}
	$(document).ready(Main());
	desList();
	admList();
	recJoinList();
	boardList();

</script>
</html>