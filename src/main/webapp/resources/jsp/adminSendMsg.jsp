<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>

<h2>관리자 공지 전송</h2>

<form action="/action_page.php">
  <label for="birthday">만료 일자 : </label>
  <input type="date" id="expDate" name="expiredDate">
</form>

<textarea rows="16" cols="64" id="content"></textarea>
<button onclick="sendMSG()">전송</button>
</body>
<script>
var content="";
var expDate="";	
	function sendMSG(){
		expDate=$("#expDate").val();
		content = $("#content").val();
		console.log("만료일 : " + expDate);
		console.log("내용 : " + content);
		
		$.ajax({
			url : "sendAdminMsg",
			type : "POST",
			data : {
				'expDate' : expDate,
				'content' : content
			},
			dateType : "JSON",
			success : function(result){
				alert(result.resMSG);
				$('#expDate').val('');
				$('#content').val('');
			},
			error : function(e){
				alert('삐익')
			}
		});
	}
</script>
</html>
