<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style></style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<body>
모든 요약 정보가 있어요.
<div class="row" id="adminRepAndNotice">
					<div class="col-sm-4">
						<h4>최근 신고 리스트</h4>
						<table class="table" id="adminRepTable">
							<tr>
								<th>신고자</th>
								<th>신고사유</th>
								<th>신고날짜</th>

							</tr>
								<tbody id="report">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>

						</table>
					</div>

					<div class="col-sm-8" style="margin: 0px 10px;">
						<h4>최근 공지 리스트</h4>
						<table class="table" id="adminNoticeTable">
							<tr>
								<th>공지번호</th>
								<th>작성자</th>
								<th>공지날짜</th>
							</tr>
							<tbody id="notice">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>

						</table>
					</div>
				</div>


				<div class="row" id="adminProfile">
					<div class="col-sm-4">
						<h3>최근 가입 유저 리스트</h3>
						<table class="table" id="adminRepTable">
							<tr>
								<th>회원번호</th>
								<th>닉네임</th>
								<th>가입날짜</th>
							</tr>
							<tbody id="recJoin">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>

						</table>
					</div>

					<div class="col-sm-8" style="margin: 0px 10px;">
						<h3>최근 게시물 리스트</h3>
						<table class="table" id="adminRecBoardTable">
							<tr>
								<th>글 번호</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
							<tbody id="board">

							</tbody>
							<tr>
								<td colspan="6" id="paging">
									<div class="pagincontainer">
										<nav area-label="Page navigation" style="text-align: center">
											<ui class="pagination" id="pagination"></ui>
										</nav>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>


</body>
<script></script>
