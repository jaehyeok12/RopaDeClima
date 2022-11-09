<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style></style>

<body>
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
</script>
</html>