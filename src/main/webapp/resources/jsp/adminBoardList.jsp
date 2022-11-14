<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.js"
	integrity="sha512-uzuo1GprrBscZGr+iQSv8+YQQsKY+rSHJju0FruVsGHV2CZNZPymW/4RkxoHxAxw3Lo5UQaxDMF8zINUfAsGeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="resources/js/jquery.twbsPagination.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

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
			<button onclick="searchBoard(1)">검색</button>
		</h3>
		<h3 id="selectedState">글 상태 :</h3>
		<input type="radio" name="state" value="정상">정상 <input
			type="radio" name="state" value="블라인드">블라인드 <input
			type="radio" name="state" value="삭제">삭제

			<button onclick="stateBoard()">상태 검색</button>
		<button onclick="load(1)">전체보기</button>
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
			<tr>
				<td colspan="6" id="paging">
					<div class="container">
						<nav area-label="Page navigation" style="text-align: center">
							<ui class="pagination" id="paginationAll"></ui>
							<ui class="pagination" id="paginationState_Norm"></ui>
							<ui class="pagination" id="paginationState_Blind"></ui>
							<ui class="pagination" id="paginationState_Deleted"></ui>
							<ui class="pagination" id="paginationSearch_Email"></ui>
							<ui class="pagination" id="paginationSearch_Nickname"></ui>
						</nav>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<!-- body end -->
</body>
<script>
	var data = "";
	var state = "";
	var email = "";
	var nickname = "";
	var showPage = 1;
	//게시글 전체 로딩
	function load(page) {
		$.ajax({
			type : "GET",
			url : "boardLoad",
			data : {
				'page' : page

			},
			dataType : "JSON",
			success : function(result) {
				console.log("전체 페이징성공");
				createBoardTable(result.resBoardLoad, result.boardDateStrs);
				var totalPages = result.total;
				//플러그인 적용
				$('#paginationAll').twbsPagination({
					startPage : page,//시작 페이지
					totalPages : totalPages,//총 페이지 수
					visiblePages : 10,//기본으로 보여질 페이지 수
					onPageClick : function(e, page) {//클릭했을 때 실행 내용
						console.log(e);
						console.log(page);
						load(page)
					}

				});

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
		if (list != undefined) {

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
		} else {
			content += '<tr><td colspan=7>조회된 데이터가 없습니다.</td></tr>'
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
	function revisionBoardState(showPage) {
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
				load(1);
			},
			error : function(e) {
				console.log('err')
			}

		});

	}
	function stateBoard(){
		var value = $('input[name="state"]:checked').val();
		console.log(value);
		page = 1;
		callStateBoards(page, value);
	}

	function callStateBoards(page, value) {
		console.log(value + "와 " + page)

		$.ajax({
			url : "stateSearch",
			type : "GET",
			data : {
				'state' : value,
				'page' : page
			},
			dataType : "JSON",

			success : function(result) {
				createBoardTable(result.searchResBoard, result.boardDateStrs);
				console.log('라인 테스트');
				var totalPages = result.total;
				console.log('라인 테스트 : ' + totalPages);
				//플러그인 적용

				if (value == '정상') {
					console.log('정상 실행');
					$('#paginationAll').empty();
					$('#paginationState_Deleted').empty();
					$('#paginationState_Blind').empty();
					$('#paginationSearch_Email').empty();
					$('#paginationSearch_Nickname').empty();
					$('#paginationState_Norm').twbsPagination({
						startPage : page,//시작 페이지
						totalPages : totalPages,//총 페이지 수
						visiblePages : 10,//기본으로 보여질 페이지 수
						onPageClick : function(e, page) {//클릭했을 때 실행 내용
							console.log(e);
							console.log(page);
							var value = $('input[name="state"]:checked').val();
							console.log(value);
							callStateBoards(page, value);
						}

					});

				} else if (value == '블라인드') {
					console.log('블라인드 실행');
					$('#paginationAll').empty();
					$('#paginationState_Deleted').empty();
					$('#paginationState_Norm').empty();
					$('#paginationSearch_Email').empty();
					$('#paginationSearch_Nickname').empty();
					$('#paginationState_Blind').twbsPagination({

						startPage : page,//시작 페이지
						totalPages : totalPages,//총 페이지 수
						visiblePages : 10,//기본으로 보여질 페이지 수
						onPageClick : function(e, page) {//클릭했을 때 실행 내용
							console.log(e);
							console.log(page);
							var value = $('input[name="state"]:checked').val();
							console.log(value);
							callStateBoards(page, value);
						}

					});
				} else {
					console.log('삭제 실행');
					$('#paginationAll').empty();
					$('#paginationSearch_Email').empty();
					$('#paginationState_Blind').empty();
					$('#paginationState_Norm').empty();
					$('#paginationSearch_Nickname').empty();
					$('#paginationState_Deleted').twbsPagination({
						startPage : page,//시작 페이지
						totalPages : totalPages,//총 페이지 수
						visiblePages : 10,//기본으로 보여질 페이지 수
						onPageClick : function(e, page) {//클릭했을 때 실행 내용
							console.log(e);
							console.log(page);
							var value = $('input[name="state"]:checked').val();
							console.log(value);
							callStateBoards(page, value);
						}

					});
				}
			},
			error : function(e) {
				console.log(e)
			}
		});
	}

	function searchBoard(page) {
		var searchType = $("#searchCategory option:selected").val();
		console.log(searchType);
		if (searchType == 'email') {//email 검색

			email = $("#searchText").val();
			console.log(email);
			$.ajax({
				url : "emailSearch",
				type : "GET",
				data : {
					'email' : email,
					'page' : page
				},
				dataType : "JSON",
				success : function(result) {
					console.log(result);
					console.log('라인 테스트');
					console.log(result.searchResEmailBoard);
					createBoardTable(result.searchResEmailBoard,
							result.boardDateStrs);
					var totalPages = result.total;
					console.log('라인 테스트 : ' + totalPages);
					//플러그인 적용
					$('#paginationAll').empty();
					$('#paginationState_Norm').empty();
					$('#paginationState_Blind').empty();
					$('#paginationState_Deleted').empty();
					$('#paginationSearch_Nickname').empty();
					$('#paginationSearch_Email').twbsPagination({
						startPage :1,//시작 페이지
						totalPages : totalPages,//총 페이지 수
						visiblePages : 10,//기본으로 보여질 페이지 수
						onPageClick : function(e, page) {//클릭했을 때 실행 내용
							console.log(e);
							console.log(page);
							searchBoard(page);
						}

					});

				},
				error : function(e) {

				}
			});
		} else {//닉네임
			nickname = $("#searchText").val();
			$.ajax({
				url : "nicknameSearch",
				type : "GET",
				data : {
					'nickname' : nickname,

					'page' : page
				},
				dataType : "JSON",
				success : function(result) {
					console.log(result.searchNickResBoard);
					createBoardTable(result.searchNickResBoard,
							result.boardDateStrs);
					console.log('라인 테스트');

					var totalPages = result.total;
					console.log('라인 테스트 : ' + totalPages);
					//플러그인 적용
					$('#paginationAll').empty();
					$('#paginationState_Norm').empty();
					$('#paginationState_Blind').empty();
					$('#paginationState_Deleted').empty();
					$('#paginationSearch_Email').empty();
					$('#paginationSearch_Nickname').twbsPagination({
						startPage : 1,//시작 페이지
						totalPages : totalPages,//총 페이지 수
						visiblePages : 10,//기본으로 보여질 페이지 수
						onPageClick : function(e, page) {//클릭했을 때 실행 내용
							console.log(e);
							console.log(page);
							load(page);
						}

					});

				},
				error : function(e) {

				}
			});
		}
	}
	load(showPage);
</script>
