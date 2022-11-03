<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table{
		
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<body>
	<table>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="userId" value="">
				<button type="button" id="overlay" value="아이디 중복 체크">중복체크</button>
			</td>
		</tr>
		<tr>	
			<th>비밀번호</th>
			<td>
				<input type="text" id="userPass" value="">
			</td>
		</tr>
		<tr>	
			<th>비밀번호 확인</th>
			<td>
				<input type="text" id="userPass2" value="">
			</td>
		</tr>
		<tr>	
			<th>이름</th>
			<td>
				<input type="text" id="userName" value="">
			</td>
		</tr>	
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" id="nickName" value="">
				<button type="button" >중복체크</button>
			</td>
		</tr>	
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" id="userbirth" value="">
			</td>
		</tr>	
		<tr>
			<th>전화번호(-제외)</th>
			<td>
				<input type="text" id="userphone" value="">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="남"/>남자
				<input type="radio" name="gender" value="여"/>여자
			</td>
		</tr>
		<tr>
				<th colspan="2"><input id="join" type="button" value="회원가입"/></th>
			</tr>
	</table>
</body>
<script>
var overlayChk = false;

$("#join").click(function(){	
	
	$id = $("#userId");
	
	if(overlayChk){
		$pw = $("#userPass");
		$pw2 = $("#userPass2")
		$name = $("#userName");
		$nick = $("#nickName");
		$birth = $("#userbirth");
		$phone = $("#userphone");
		$gender = $("input[name='gender']:checked");		
		
		if($id.val()==''){
			alert('아이디를 입력해 주세요');
			$id.focus();
		}else if($pw.val()==''){
			alert('패스워드를 입력해 주세요');
			$pw.focus();
		}else if($name.val()==''){
			alert('이름을 입력해 주세요');
			$name.focus();
		}else if($age.val()==''){
			alert('나이를 입력해 주세요');
			$age.focus();
		}else if($gender.val()==null){
			alert('성별을 입력해 주세요');
			$gender.focus();
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else{
			console.log('서버로 전송');
			var param = {};
			param.id = $id.val();
			param.pw = $pw.val();
			param.name = $name.val();
			param.age = $age.val();
			param.gender = $gender.val();
			param.email = $email.val();
			console.log(param);
			
			$.ajax({
				type:'POST',
				url:'ajaxJoin',
				data:param,
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success>0){
						alert("회원 가입에 성공 했습니다.");
						location.href="./";
					}else{
						alert("회원 가입에 실패 했습니다.");
					}					
				},
				error:function(e){
					console.log(e);
				}
			});
			
		}
		
		
	}else{
		alert('중복 아이디 체크를 진행해 주세요!');
		$id.focus();
	}
	
	
});
	
	
	$("#overlay").click(function(){
		var id = ${"#userId"}.val();
		console.log(id);
		$.ajax({
			type:'GET',
			url:'overlay',
			data:{'id':id},
			dataType:'JSON',
			success:function(data){
				console.log(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	
</script>
</html>