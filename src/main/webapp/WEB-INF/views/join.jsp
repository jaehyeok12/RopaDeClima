<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
		margin-top: 20px;
		width: 1000px;
		
	}

	table, th, td {
		padding: 50px 10px;
	}
	
	th{
		width: 300px;
		text-align: center;
	}
	
	p {
		font-size: 3px;
	}
	input[type="text"]{
		width: 500px;
		height: 30px;
	}
	
	
</style>
</head>
<body>
	<header>
		<div>
		</div>
	</header>

	<table>
		<tr>
			<th>이메일</th>
			<td><input type="text" id="userId" value="" placeholder="이메일">
				<button type="button" id="overlay" value="아이디 중복 체크" class="btn btn-primary">중복체크</button></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" id="userPass" value="" placeholder="비밀번호">
				<p>비밀번호는 8~20자 사이로 입력해주세요.</p></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="text" id="userPass2" value=""
				placeholder="비밀번호 확인"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="userName" value="" placeholder="이름">
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" id="nickName" value="" placeholder="닉네임">
				<button type="button" id="over" value="닉네임 중북 체크" class="btn btn-primary">중복체크</button></td>
		</tr>
		<tr>
			<th>생년월일 ex)990101</th>
			<td><input type="text" id="userbirth" value=""
				placeholder="생년월일 ex) 990101"></td>
		</tr>
		<tr>
			<th>전화번호(-제외)</th>
			<td><input type="text" id="userphone" value=""
				placeholder="전화번호(-제외)"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="radio" name="gender" value="남" />남자
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input
				type="radio" name="gender" value="여" />여자</td>
		</tr>
		<tr>
			<th colspan="2"><input id="join" type="button" value="회원가입" class="btn btn-primary" /></th>
		</tr>
	</table>
</body>
<script>
var overlayChk = false;
var email_rule = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;


	$id = $("#userId");
$("#join").click(function(){	

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
			alert('비밀번호를 입력해 주세요');
			$pw.focus();
		}else if($pw.val()!=$pw2.val()){
			alert('비밀번호가 일치 하지 않습니다.');	
		}else if($pw2.val()==''){
			alert('비밀번호를 확인 해주세요');
			$pw2.focus();
		}else if($name.val()==''){
			alert('이름을 입력해 주세요');
			$name.focus();
			
			
			
		}else if($nick.val()==''){
			alert('닉네임을 입력해 주세요');
			$nick.focus();
		}else if($birth.val()==''){
			alert('생년월일을 입력해 주세요');
			$birth.focus();
		}else if($phone.val()==''){
			alert('전화번호을 입력해 주세요');
			$phone.focus();
		}else if($gender.val()==null){
			alert('성별을 입력해 주세요');
			$gender.focus();
		}else{
			console.log('서버로 전송');
			var param = {};
			param.id = $id.val();
			param.pw = $pw.val();
			param.pw2 = $pw.val();
			param.name = $name.val();
			param.nick = $nick.val();
			param.birth = $birth.val();
			param.phone = $phone.val();
			param.gender = $gender.val();
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
	var id = $("#userId").val();
	console.log(id);
	
	if(!email_rule.test($id.val())){
		alert("이메일을 형식에 맞게 입력해주세요.");
		return false;
	}
	$.ajax({
		type:'GET',
		url:'overlay',
		data:{'id':id},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.overlay){
				alert('이미 사용중인 아이디 입니다.');
				$('#userId').val('');
			}else{
				overlayChk = true;
				alert('사용 가능한 아이디 입니다.');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});

$("#over").click(function(){
	var nickName = $("#nickName").val();
	console.log(nickName);
	$.ajax({
		type:'GET',
		url:'over',
		data:{'nickName':nickName},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.over){
				alert('이미 사용중인 닉네임 입니다.');
				$('#nickName').val('');
			}else{
				overlayChk = true;
				alert('사용 가능한 닉네임 입니다.');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});

// 닉네임,이름 한글 유효성 검사
	$("#userName").keyup(function (event) {
	    regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	    v = $(this).val();
	    if (regexp.test(v)) {
	        alert("실명을 입력하여 주세요\n한글만 입력 가능합니다.");
	        $(this).val(v.replace(regexp, ''));
    	}    
	});
    
	$("#nickName").keyup(function (event) {
	    regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	    v = $(this).val();
	    if (regexp.test(v)) {
	        alert("한글자 이상 입력해주세요\n한글만 입력 가능합니다.");
	        $(this).val(v.replace(regexp, ''));
    	}
	});
    
    $("#userbirth").keyup(function (event) {
        regexp = /[^0-9]/gi;
        v = $(this).val();
        if (regexp.test(v)) {
            alert("숫자만 입력 가능합니다\n생년월일을 입력해 주세요");
            $(this).val(v.replace(regexp, ''));
        }
        reg = /\d\d\d\d\d\d{2,7}/gi;
        v = $(this).val();
        if (reg.test(v)) {
            alert("생년월일을 입력해주세요.\nex)990101");
            $(this).val(v.replace(reg, ''));
        }
    });
    
    
    




</script>
</html>