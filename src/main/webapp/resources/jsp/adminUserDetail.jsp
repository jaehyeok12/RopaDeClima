<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style></style>
<body>

<div class="container">
  <h2>Dynamic Tabs</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#userBoardList">유저 게시글 리스트</a></li>
    <li><a data-toggle="tab" href="#userLikeList">유저 좋아요 리스트</a></li>
    <li><a data-toggle="tab" href="#userRepList">유저 신고 리스트</a></li>
    <li><a data-toggle="tab" href="#userCommentList">유저 댓글 리스트</a></li>
    <li><a data-toggle="tab" href="#userBookmarkList">유저 북마크 리스트</a></li>
  </ul>

  <div class="tab-content">
    <div id="#home" class="tab-pane fade in active">
      <h3>게시글 리스트</h3>
      <p>난 게시글이에용</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>좋아요 리스트</h3>
      <p>좋아요에용</p>
    </div>
    <div id="#userRepList" class="tab-pane fade">
      <h3>신고 리스트</h3>
      <p>신고에용</p>
    </div>
    <div id="#userCommentList" class="tab-pane fade">
      <h3>댓글 리스트</h3>
      <p>댓글이에올</p>
    </div>
        <div id="#userBookmarkList" class="tab-pane fade">
      <h3>북마크 리스트</h3>
      <p>북마크에용</p>
    </div>
  </div>
      <hr>
    <p class="act"><b>Active Tab</b>: <span></span></p>
    <p class="prev"><b>Previous Tab</b>: <span></span></p>
</div>

</body>
<script>
//탭 관련 functions
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
  $('.nav-tabs a').on('shown.bs.tab', function(event){
	    var x = $(event.target).text();         // active tab
	    var y = $(event.relatedTarget).text();  // previous tab
	    $(".act span").text(x);
	    $(".prev span").text(y);
	  });
});

</script>
</html>