<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<style>
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

hr {
	margin: 0px;
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
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
					<select id="revState">

						<option>정상</option>
						<option>블라인드</option>
					</select>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="revisionBoardState()">확인</button>
				</div>

			</div>
		</div>
	</div>

	<div id="boardContents">
		<h3>
			<select id="searchCategory">
				<option value="email">이메일</option>
				<option value="nickname">닉네임</option>
			</select> : <input type="text" id="searchText">
			<button id="searchBoard">검색</button>
		</h3>
		<h3 id="selectedState">글 상태 :</h3>
		<input type="radio" name="state" value="정상">정상 <input
			type="radio" name="state" value="블라인드">블라인드 <input
			type="radio" name="state" value="삭제">삭제

		<button onclick="load()">전체보기</button>
		<table>
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>작성자 이메일</th>
					<th>작성자 닉네임</th>
					<th>작성 일자</th>
					<th>좋아요 수</th>
					<th>게시글 상태</th>
					<th>상태 변경</th>
				</tr>
			</thead>
			<tbody id="boardList">

			</tbody>
		</table>
	</div>

	<!-- body end -->
</body>
<script>
	var data = "";
	var state = "";
	var email = "";
	var nickname = "";
	//게시글 전체 로딩
	function load() {
		$.ajax({
			type : "GET",
			url : "boardLoad",
			data : {},
			dataType : "JSON",
			success : function(result) {
				console.log("성공");
				createBoardTable(result.resBoardLoad, result.boardDateStrs);
			},
			error : function(e) {
				console.log("error");
			}
		});

	}
	//리스트를 테이블로 뽑아주는 친구
	function createBoardTable(list, dateStrs) {
		console.log(list);
		console.log("이걸로 이제 테이블 만든다.");
		var content = '';
		if(list!=undefined){
			
		for (var i = 0; i < list.length; i++) {
			content += '<tr>';
			content += '<td>' + list[i].board_num + '</td>';
			content += '<td>' + list[i].mem_email + '</td>';
			content += '<td>' + list[i].mem_nickname + '</td>';
			content += '<td>' + dateStrs[i] + '</td>';
			content += '<td>' + list[i].board_good + '</td>';
			content += '<td>' + list[i].board_State + '</td>';
			content += '<td><button class="btn-modal" data-toggle="modal" data-target="#myModal" data-id="'+list[i].board_num+'">글 상태 변경</button></td>'
			content += '</tr>';
		}
		}else{
			content +='<tr><td colspan=7>조회된 데이터가 없습니다.</td></tr>'
		}
		$("#boardList").empty();
		$("#boardList").append(content);

	}
	//모달 처리
	//모달 처리
	$(document).on('click', '.btn-modal', function() {
		console.log('test');
		data = $(this).data('id');
		console.log(data);
		$("#modalTitle.modal-title").val(data);
		$("#modalTitle.modal-title").html(data + "번 게시글 상태 변경");
	});
	function revisionBoardState() {
		data = $("#modalTitle.modal-title").val();
		state = $("#revState option:selected").val();
		console.log(data + "번 게시글을 " + state + "처리 할꺼야.");

		$.ajax({
			url : "reviseState",
			type : "GET",
			data : {
				'board' : data,
				'state' : state
			},
			dataType : "JSON",
			success : function(result) {
				console.log('success');
				load();
			},
			error : function(e) {
				console.log('err')
			}

		});

	}
//라디오버튼 검색
$('input[name="state"]').change(function(){
        var value = $(this).val();
        var checked = $(this).prop('checked');
        $.ajax({
        	url : "stateSearch",
        	type : "GET",
        	data : {
        		'state' : value
        	},
        	dataType : "JSON",
        	
        	success : function(result){
				createBoardTable(result.searchResBoard, result.boardDateStrs);
        	},
        	error : function(e){}
        });
});

$("#searchBoard").click(function(){
	var searchType = $("#searchCategory option:selected").val();
	console.log(searchType);
	if(searchType=='email'){//email 검색
	
	email = $("#searchText").val();
	console.log(email);
	$.ajax({
		url : "emailSearch",
		type : "GET",
		data : {
			'email' : email
		},
		dataType : "JSON",
		success : function(result){
			console.log(result);
			console.log(result.searchResEmailBoard);
			createBoardTable(result.searchResEmailBoard, result.boardDateStrs);
		},
		error : function(e){
			
		}
	});
	}else{//닉네임
		nickname = $("#searchText").val();
		$.ajax({
			url : "nicknameSearch",
			type : "GET",
			data : {
				'nickname' : nickname
			},
			dataType : "JSON",
			success : function(result){
				console.log(result.searchNickResBoard);
				createBoardTable(result.searchNickResBoard, result.boardDateStrs);
			},
			error : function(e){
				
			}
	});
	}
})
load();
</script>
