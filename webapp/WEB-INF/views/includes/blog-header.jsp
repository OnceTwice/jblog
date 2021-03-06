<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="header">
	<h1><a href="${pageContext.request.contextPath }/blog">Spring 이야기</a></h1>
	<ul class="menu">
		<c:choose>
			<c:when test="${empty authUser }">
				<li><a href="${pageContext.request.contextPath }/blog">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath }/blog/logout">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath }/blog/blog-admin-basic">${authUser.name }님 블로그 관리</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>