<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conimal</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#find-btn").click(function(){
			if($("#user_id").val() == "") {
				$("#id_check").text("아이디를 입력해주세요.");
				$("#id_check").css("color", "red");
			} else {
				$("#id_check").text("");
			}
			if($("#email").val() == "") {
				$("#email_check").text("이메일을 입력해주세요.");
				$("#email_check").css("color", "red");
			} else {
				$("#email_check").text("");
			}
			console.log("ajax 이전");
			console.log("id : " + $("#user_id").val());
			console.log("email : " + $("#email").val());
			$.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/join/findPwd?user_id=" + $("#user_id").val() + "&email=" + $("#email").val(),
				success : function (data) {
					console.log(data);
					alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");
				}
			});
		});
	});
</script>
<body>
<%@ include file="../include/header.jsp" %>
<div class="page-container">
	<div class="">
		<h3>비밀번호 찾기</h3>
		<p>인증된 이메일만 사용 가능합니다.</p>
	</div>
	
	<div id="search">
		<input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요.">
			<div id="id_check"></div>
		<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
			<div id="email_check"></div>
		<div id="btn">
			<button class="btn mar0_auto" id="find-btn">확인</button>
		</div>
	</div>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>