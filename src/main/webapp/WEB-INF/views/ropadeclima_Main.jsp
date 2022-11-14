<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

img {
	border: solid white;
	width: 170px;
	height: 170px;
	padding: 5px 10px;
	padding-bottom: 0px;
}
#list{
	float: left;
	padding-left:300px
	 
}

p{
	margin-top: 0px;
}

.navbar-inverse{
	height : 72px;
	background-color: gray;
}


</style>

<body>
	<nav class="navbar-inverse">
		
	</nav>
	<h1>날씨</h1>
	<button class="login">로그인</button>
	<h2 class="weather">${SKY.fcstValue}</h2>
	<button class="allShow">전체조회</button> 
	<button class ="newOrder">최신순</button>
	<button class ="like">인기순</button>

	<h3>오늘의 날씨</h3> <br>
	
	<table id="weather">
		<thead>
			<tr>
				
				<th>오늘 날짜</th>
				<td>${TMX.fcstDate}</td>
				<th id="TMX">최고 온도</th>
				<td>${TMX.fcstValue}</td>
				<th id="TMN">최저 온도</th>
				<td>${TMN.fcstValue}</td>
			</tr>
		</thead>
	</table>
		
	<div id="list">	
	</div>


</body>
<script>
	var sky = ${SKY.fcstValue};
	console.log(sky);
	var tmx = ${TMX.fcstValue};
	var tmn = ${TMN.fcstValue};
	var msg = "조회된 기록이 없습니다.";
	api();
	recommend_list();
	console.log(tmn, tmx);
	

	function recommend_list() {
		$.ajax({
			type : 'GET',
			url : 'recommend',
			data : {'tmn':tmn, 'tmx':tmx},//where 절에 들어가는게 없으면 매개변수가 들어가지 않음.
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				drawList(data.url);//컨트롤러에서 보낸 hashmap의 키값:list->value값:data.list
			}
			,error : function(e) {
				console.log(e);
			}
		});
	}
	// 추천하기
	function drawList(url) {
		
		var content = '';
		var area = '';
		for(var i=0; i<url.length; i++){
			content += '<div style = "float:left">';
			content += '<img src ="'+ url[i] +'">';
			//content += '<p>'+url.board_num+'</p>'+'</div>'		
			content += '</div>'		
			if(i%4 == 0){
				content += '<br>';
			}
			
		}
		if(url.length == 0){
			alert(msg);
		}
			console.log(content);
			$('#list').empty();
			$('#list').append(content);
	}
	
	//전체조회
	function allShow_list(allShow) {
		
		var content = '';
		var area = '';
		for(var i=0; i<allShow.length; i++){
			content += '<div style = "float:left">';
			content += '<img src ="'+ allShow[i] +'">';
			content += '</div>'		
			if(i%4 == 0){
				content += '<br>';
			}	
		}
			console.log(content);
			$('#list').empty();
			$('#list').append(content);
	}
	
	//최신순 조회
	function newOrder(newOrder) {
		
		var content = '';
		var area = '';
		for(var i=0; i<newOrder.length; i++){
			content += '<div style = "float:left">';
			content += '<img src ="'+ newOrder[i] +'">';
			content += '</div>'		
			if(i%4 == 0){
				content += '<br>';
			}	
		}
			console.log(content);
			$('#list').empty();
			$('#list').append(content);
	}
	
	//인기순 조회
	function likeList(like) {
		var content = '';
		var area = '';
		for(var i=0; i<like.length; i++){
			content += '<div style = "float:left">';
			content += '<img src ="'+ like[i] +'">';
			content += '</div>'		
			if(i%4 == 0){
				content += '<br>';
			}	
		}
			console.log(content);
			$('#list').empty();
			$('#list').append(content);
	}
// 4의 배수마다 br 태그 삽입
	function api() {
		$.ajax({
			type : 'GET',
			url : 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=0C0KxQlchEfYKRkvh2LGG%2BA1EWgJYxjN9yNA1TOUc94OOtJV9yHRv8a0yJj5DnyLaR%2F3qbtacF808BhBY8tr3w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20221109&base_time=0500&nx=37&ny=126',
			data : {},
			dateType : 'JSON',
			success : function(data) {
				console.log(data);
			}
			,error : function(e) {
				console.log(e);
			}
		});
	}
	$(function(){
		$('.allShow').click(function(){
			$.ajax({
				type : 'GET',
				url : 'allShow',
				data : {},
				dataType : 'JSON',
				success : function(data){
					console.log(data);
					allShow_list(data.allShow);
				},
				error : function(e){
					console.log(e);
				}
				
			});
		});
	});
	
	$(function(){
		$('.newOrder').click(function(){
			$.ajax({
				type : 'GEt'
				,url : 'newOrder'
				,data : {}
				,dtataType : 'JSON'
				,success : function(data){
					console.log(data);
					allShow_list(data.newOrder);
				}
				,error : function(e){
					console.log(e);
				}
			});
		});
	});
	
	
	$(function(){
		$('.allShow').click(function(){
			if($(this).text()== '전체조회'){
				$(this).text('추천하기');
			}else{
				$(this).text('전체조회');
				if($(this).text()=='전체조회'){
					recommend_list();
				}
			}
		});
	});
	
	$(function (){
		$('.like').click(function(){
			$.ajax({
				type : 'GET'
				,url : 'like'
				,data : {}
				,dataType : 'JSON'
				,success : function (data) {
					console.log(data);
					allShow_list(data.like);
				}
				,error : function(e){
					console.log(e);
				}
			});
		});
	});
	
	// 날씨 알림
	 $(function(){
		if($('.weather').text()==4){
			$('.weather').text('흐림');
		}
		if($('.weather').text()==3){
			$('.weather').text('구름많음');
		}
		if($('.weather').text()==1){
			$('.weather').text('맑음');
		}
	}); 
	
	  $(function(){
		$('.login').click(function(){
	 		$.ajax({
	 			type : 'GET'
	 			,url : 'mainLogin'
	 			,data : {}
	 			,success : function(){
	 				console.log('move the login');
	 				moveLogin();
	 			}
	 			,error : function(e){
	 				console.log(e);
	 			}
	 		});
	 	});	
	});  
	  
	function moveLogin() {
		$('.login').click(function(){
			location.href='mainLogin';
		});
	}
	
 	
	
	
	
</script>
</html>