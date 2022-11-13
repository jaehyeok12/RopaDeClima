<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style></style>

<link rel="stylesheet"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<body>
	<ul class="nav nav-tabs" id="tab">
		<li class="nav-item"><a class="nav-link active" id="home-tab"
			data-toggle="tab" href="#manageClothes">의상</a></li>
		<li class="nav-item"><a class="nav-link" id="profile-tab"
			data-toggle="tab" href="#manageColord">색상</a></li>
		<li class="nav-item"><a class="nav-link" id="messages-tab"
			data-toggle="tab" href="#manageWeathers">날씨</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="settings-tab" data-toggle="tab" href="#manageRepReasoms">신고
				사유</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="manageClothes">

			<ul class="nav nav-tabs" id="tab">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#manageClothes_Top">상의</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#manageClothes_Bottom">하의</a></li>
				<li class="nav-item"><a class="nav-link" id="messages-tab"
					data-toggle="tab" href="#manageClothes_Shoe">신발</a></li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="settings-tab" data-toggle="tab" href="#manageClothes_Outer">아우터</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="manageClothes_Top">상의 관리
				</div>
				<div class="tab-pane" id="manageClothes_Bottom">하의 관리</div>
				<div class="tab-pane" id="manageClothes_Shoe">신발 리스트</div>
				<div class="tab-pane" id="manageClothes_Outer">아우터 관리</div>
			</div>

		</div>
		<div class="tab-pane" id="manageColord">색상 관리</div>
		<div class="tab-pane" id="manageWeathers">날씨를 관리를 해보죠</div>
		<div class="tab-pane" id="manageRepReasoms">신고사유 관리!</div>
	</div>
</body>
<script>
const triggerTabList = [...document.querySelectorAll('#myTab a'];
triggerTabList.forEach((triggerEl) => {
  const tabTrigger = new bootstrap.Tab(triggerEl)

  triggerEl.addEventListener('click', (e) => {
    e.preventDefault()
    tabTrigger.show()
  })
})
</script>
</html>