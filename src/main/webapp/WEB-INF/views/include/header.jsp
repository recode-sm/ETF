<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="border-bottom mb-4">
	<div class="container">
		<header	class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3">
			<a href="${pageContext.request.contextPath}/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
				<img class="bi me-2" height="32" role="img" aria-label="Bootstrap" alt="" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>

			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="${pageContext.request.contextPath}/" class="nav-link px-2 link-dark">시작</a></li>
				<li><a href="${pageContext.request.contextPath}/etf/etfBoard" class="nav-link px-2 link-dark">상품정보</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">게시판</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">고객센터</a></li>
			</ul>
			
			<c:if test="${ empty sessionScope.id }">
				<div class="col-md-3 text-end d-inline">
				 	<button type="button" class="btn btn-outline-primary me-2" onclick="location.href='${pageContext.request.contextPath}/member/loginForm'">로그인</button>
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/joinForm'">회원가입</button>      		      		     	
				</div>				
			</c:if>

			<c:if test="${! empty sessionScope.id }">
				<div class="col-md-3 text-end d-inline dropdown">
					<button class="btn btn-secondary p-0" type="button"	id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="width: 38px;">
						<i class="bi bi-list" style="font-size: 24px;" ></i>
					</button>				
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><span class="dropdown-item">${sessionScope.id }님</span> </li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberInfo">내정보</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					</ul>
				</div>
			</c:if>
		</header>
	</div>
</div>

