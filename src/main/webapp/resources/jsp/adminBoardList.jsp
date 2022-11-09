<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
</head>
<body>
	<div id="boardContents">
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
</script>
