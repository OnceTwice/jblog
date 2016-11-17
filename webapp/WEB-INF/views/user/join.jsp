<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<title>JBlog</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#join-form").submit(function() {
				// 1. 이름 체크
				if($("#name").val() == "") {
					console.log("이름체크");
					$("#dialog p").text("이름은 필수 입력 항목입니다.");
					$("#dialog").dialog();
					$("#name").focus();
					return false;
				}
				
				// 2. id 체크
				if($("#id").val() == "") {
					console.log("아이디 체크");
					$("#dialog p").text("아이디는 필수 입력 항목입니다.");
					$("#dialog").dialog();
					$("#id").focus();
					return false;
				}
				
				// 3. 비밀번호 체크
				if($("#password").val() == "") {
					console.log("비밀번호 체크");
					$("#dialog p").text("비밀번호는 필수 입력 항목입니다.");
					$("#dialog").dialog();
					$("#password").focus();
					return false;
				}
				
				// 4. 약관동의
				if($("#agree-prov").is(":checked") == false) {
					console.log("약관동의 체크");
					alert("약관 동의를 해야 합니다.");
					return false;
				}
				
				return true;
			});
		});
	</script>
</head>
<body>
	<div class="center-content">
		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		
		<form class="join-form" id="join-form" method="post" action="${pageContext.request.contextPath }/user/join">
			<label class="block-label" for="name">이름</label>
			<input id="name"name="name" type="text" value="">
			
			<label class="block-label" for="id">아이디</label>
			<input id="id" name="id" type="text"> 
			<input id="btn-checkid" type="button" value="id 중복체크">
			<img id="img-checkemail" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">

			<label class="block-label" for="password">패스워드</label>
			<input id="password" name="password" type="password" />

			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">
		</form>
		
	</div>
	<div id="dialog" title="가입폼 체크" style="display:none">
  		<p></p>
	</div>
</body>
</html>
