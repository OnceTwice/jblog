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
				return true;
				// 1. 이름 체크
				if($("#name").val() == "") {
					console.log("이름체크");
					$("#dialog p").text("이름은 필수 입력 항목입니다.");
					$("#dialog").dialog();
					$("#name").focus();
					return false;
				}
				
				// 2-1. id 체크
				if($("#id").val() == "") {
					console.log("아이디 체크");
					$("#dialog p").text("아이디는 필수 입력 항목입니다.");
					$("#dialog").dialog();
					$("#id").focus();
					return false;
				}
				
				// 2-2. id 중복 체크 유무
				if($("#img-checkid").is(":visible") == false) {
					alert("아이디 중복 체크를 해야 합니다.");
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
			
			$("#id").change(function() {
				$("img-checkid").hide();
				$("btn-checkid").show();
			});
			
			$("#btn-checkid").click(function() {
				console.log("클릭되었습니다.");
				var id = $("#id").val();
				if(id == "") {
					return;
				}
				
				$.ajax({
					url : "${pageContext.request.contextPath }/user/api/checkid?id=" + id,
					type : "get",
					dataType : "json",
					data : "",
					success : function(response) {
						console.log(response);
						if(response.result == "fail") {
							console.log(response.message);
							return;
						}
						
						// success
						if(response.data == "exist") {
							alert("이미 존재하는 아이디입니다. 다른 아이디를 사용해 주세요.");
							$("#id").val("").focus();
							return;
						}
						
						// 존재하지 않은 아이디
						$("#img-checkid").show();
						$("#btn-checkid").hide();
					},
					error : function(jqXHR, status, e) {
						console.error(status + " : " + e);
					}
				});	// end ajax
			});	// end click
		}); // end function
	</script>
</head>
<body>
	<div class="center-content">
		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		
		<form:form modelAttribute="userVo" class="join-form" id="join-form" method="post" action="${pageContext.request.contextPath }/user/join">
			<label class="block-label" for="name">이름</label>
			<form:input path="name"/>
			<p style="text-align:left; color:red">
				<form:errors path="name"/>
			</p>
			
			<label class="block-label" for="id">아이디</label>
			<form:input path="id"/>
			<img id="img-checkid" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">
			<input id="btn-checkid" type="button" value="id 중복체크">
			<p style="text-align:left; color:red">
				<form:errors path="id"/>
			</p>
			
			<label class="block-label" for="password">패스워드</label>
			<form:input path="password"/>
			<p style="text-align:left; color:red">
				<form:errors path="password"/>
			</p>

			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">
		</form:form>
	</div>
	<div id="dialog" title="가입폼 체크" style="display:none">
  		<p></p>
	</div>
</body>
</html>
