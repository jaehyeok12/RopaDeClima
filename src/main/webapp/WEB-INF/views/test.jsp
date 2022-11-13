<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
=======
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
>>>>>>> origin/master
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


</style>

<body>
<<<<<<< HEAD
	<h1>날씨</h1>
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
			content += '<p>'+ ${url.mem_nickname} +'</p>';
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
			content += '<p>'+ ${allShow.mem_nickname} +'</p>';		
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
			content += '<p>'+ ${newOrder.mem_nickname} +'</p>';		
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
			content += '<p>'+ ${like.mem_nickname} +'</p>';		
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
					newOrder(data.newOrder);
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
					likeList(data.like);
				}
				,error : function(e){
					console.log(e);
				}
			});
		});
	});
	
	
 
	

=======
<h1>날씨</h1>
<h3 id="tmp">오늘의 기온 : </h3>

</body>
<script>
function weather(){
	jQuery.ajax({
		url:"/project/api/weather",
		type : "get",
		timeout : 30000,
		contentType:"application/json",
		dataType:"json",
		success : function(data, status, xhr){
			
			let dataheader = data.result.response.header.resultCode;
				console.log(data);
		
			if(dataheader="00"){
				console.log("success ==> ");
				console.log(data);
			}else{
				console.log("fail ==> ");
				console.log(data);
			}
		var tmp = data.result.response.body.items.item[0].fcstValue
		console.log(tmp);
		$("#tmp").append(tmp);
		},
		error:function(e, status, xhr, data){
			console.log("err");
			console.log(e);
		}
	})
	
	
}

weather();
>>>>>>> origin/master
</script>
</html>