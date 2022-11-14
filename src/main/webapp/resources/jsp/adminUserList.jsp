<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
</head>
<style></style>
<body>
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="modalTitle"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<select id="revAuths">

						<option>user</option>
						<option>admin</option>
						<option>chiefAdmin</option>
					</select>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="revisionAuths()">확인</button>
				</div>

			</div>
		</div>
	</div>

	<h3>
		닉네임 : <input type="text" id="searchText">
		<button type="button" onclick="searchUser()">검색</button>
	</h3>
	<h3 id="selectedAuth">계정 권한 :</h3>
	<select id="auths">
		<option value="user">user</option>
		<option value="admin">admin</option>
		<option value="chiefAdmin">chiefAdmin</option>
	</select>
	<button id="select">선택</button>
	<button onclick="load(1)">전체 조회</button>

	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>e-mail</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>계정 권한</th>
				<th>계정 상태</th>
				<th>탈퇴 및 복구</th>
				<th>권한 수정</th>

			</tr>
		</thead>
		<tbody id="userList">

		</tbody>
		<tr>
			<td colspan="6" id="paging">
				<div class="container">
					<nav area-label="Page navigation" style="text-align: center">
						<ui class="pagination" id="paginationAll"></ui>
						<ui class="pagination" id="paginationSearch"></ui>
					</nav>
				</div>
			</td>
		</tr>
	</table>


</body>
<script>

var data='';
var auth='';
var showPage=1;

var auths = $('#auths option:selected').val();
//계정 권한 선택
$('#select').click(function(e){
	auth = $("#auths option:selected").val();
	console.log($("#auths option:selected").val()+"선택")
	$('#selectedAuth').empty();
	$('#selectedAuth').append('계정 권한 : '+ auth);
	
});
load(showPage);
//전체 로딩
function load(page){
	console.log(page)
	$.ajax({
		type : "GET",
		url : "userLoad",
		data : {page:page},
		dataType : "JSON",
		success : function(result){
			console.log("성공");
			console.log(result);
			createUserTable(result.list);
			
			var totalPages = result.total;
			//플러그인 적용
			$('#paginationSearch').empty();
			$('#paginationAll').twbsPagination({
				startPage:page,//시작 페이지
				totalPages:totalPages,//총 페이지 수
				visiblePages:10,//기본으로 보여질 페이지 수
				onPageClick:function(e,page){//클릭했을 때 실행 내용
					console.log(e);	
					console.log(page);	
					load(page);
				}
			
			
			});
			
		},
		error : function(e){
			console.log("error");
		}
	});
	
}
//리스트를 테이블로 뽑아주는 친구
function createUserTable(list){
	
	console.log("이걸로 이제 테이블 만든다.");
	var content = '';
	for (var i = 0; i < list.length; i++) {
		content += '<tr>';
		content += '<td>'+list[i].mem_num+'</td>';
		content += '<td>'+list[i].mem_email+'</td>';
		content += '<td>'+list[i].mem_name+'</td>';
		content += '<td>'+list[i].mem_nickname+'</td>';
		content += '<td>'+list[i].mem_autority+'</td>';
		if(list[i].mem_ban){
			
		content += '<td>정상</td>';
		}else{
		content += '<td>탈퇴</td>';
			
		}
		if(list[i].mem_ban){
			content += '<td><button onclick="userBan('+list[i].mem_num+')">탈퇴</button></td>'
		}else{
			content += '<td><button onclick="userRecover('+list[i].mem_num+')">복구</button></td>'
		}
//<button class="btn-modal" data-toggle="modal" data-target="#myModal" data-id="'+list[i].mem_nickname+'">권한 변경</button>
		content += '<td><button class="btn-modal" data-toggle="modal" data-target="#myModal" data-id="'+list[i].mem_nickname+'">권한 변경</button></td>';
		content += '</tr>';
	}
	$("#userList").empty();
	$("#userList").append(content);

}

//유저 탈퇴처리
function userBan(id){
	var id= id;
	alert('해당 유저를 탈퇴처리 합니다.');
	$.ajax({
		url : "userBan",
		type : "GET",
		data : {'id' : id},
		dataType : "JSON",
		success : function(result){
			console.log('탈퇴처리 완료');
			load(showPage);
		},
		error : function(e){
			console.log('실패');
		}
	});
}
//유저 복구처리
function userRecover(id){
	var id= id;
	alert('해당 유저를 복구처리 합니다.');
	$.ajax({
		url : "userRecover",
		type : "GET",
		data : {'id' : id},
		dataType : "JSON",
		success : function(result){
			console.log('복구처리 완료');
			load(showPage);
		},
		error : function(e){
			console.log('실패');
		}
	});
}
//모달 처리
$(document).on('click', '.btn-modal', function(){
	 	console.log('test');
	 	data = $(this).data('id');
	 	console.log(data);
	    $("#modalTitle.modal-title").val(data);
	    $("#modalTitle.modal-title").html(data+"의 권한 변경");
	});
//권한 수정
function revisionAuths(){
	data = $("#modalTitle.modal-title").val();
	auth = $("#revAuths option:selected").val();
	console.log(data+"를 " + auth +"로 바꿀꺼야.");
	
	$.ajax({
		url : "reviseAuth",
		type : "GET",
		data : {
			'nickname' : data,
			'auth' : auth
		},
		dataType : "JSON",
		success : function(result){
			console.log('success');
			load(showPage);
			
		},
		error : function(e){
			console.log('err')
		}
		
	});
	
}
//검색을 해보자!
function searchUser(page){
	data='';
	auth='';
	data=$("#searchText").val();
	auth=$("#auths option:selected").val();
	page = 1;
	console.log("입력한 닉네임 ==> "+data);
	console.log("선택한 권한 ==> "+auth);
	console.log("선택한 페이지 ==> "+showPage);
	if(data==''){
		alert('닉네임을 입력해주세요!');
	}else{
		if(auth=='undefined'){
			//닉네임만 검색하기
			$.ajax({
				url : "nickSearch",
				type : "GET",
				data : {
					'nickname' : data,
					'page':page	
				},
				dataType : "JSON",
				success : function(result){
					
					
					createUserTable(result.list);

					var totalPages = result.total;
					//플러그인 적용
					$('#paginationAll').empty();
					$('#paginationSearch').twbsPagination({
						startPage:1,//시작 페이지
						totalPages:totalPages,//총 페이지 수
						visiblePages:10,//기본으로 보여질 페이지 수
						onPageClick:function(e,page){//클릭했을 때 실행 내용
							console.log(e);	
							console.log(page);	
							searchUser(page);
						}
					
					});
				},
				error : function(e){
					console.log("SearchError");
				}
			});
		}else{
			//닉네임 + 권한으로 검색
			$.ajax({
				url : "nickAuthSearch",
				type : "GET",
				data : {
					'nickname' : data,
					'auth' : auth,
					'page':showPage
				},
				dataType : "JSON",
				success : function(result){
					createUserTable(result.list);
					var totalPages = result.totals;
					//플러그인 적용
					$('#paginationAll').empty();
					$('#paginationSearch').twbsPagination({
						startPage:1,//시작 페이지
						totalPages:totalPages,//총 페이지 수
						visiblePages:10,//기본으로 보여질 페이지 수
						onPageClick:function(e,page){//클릭했을 때 실행 내용
							console.log(e);	
							console.log(page);	
							searchUser(page);
						}
					
					});
				},
				error : function(e){
					console.log("SearchError");
				}
			});
		}
	}
	
};

//전체 조회

</script>
</html>