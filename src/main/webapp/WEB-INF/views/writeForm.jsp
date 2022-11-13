<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
</head>
<body>
	<form action="write" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo"></td>
			</tr>
			<tr> 
				<td colspan="2" class="btn_area"> 
					<button>저장</button>
				</td>
			</tr>
		</table>
	</form>

</body>
<script></script>
</html>