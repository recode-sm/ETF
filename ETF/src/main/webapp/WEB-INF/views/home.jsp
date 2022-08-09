<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- CSS only -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/custom.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 카카오 API 사용 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
//     var CHANNEL_ID = "_GVVslslk"; // 수정 할 것 :  https://center-pf.kakao.com/ 에서 _GVVslslk 형태의 ID 입력
//     SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('dbfa764ca9e9d4296dc9b5d7026121db'); //★ 수정 할 것 : 내 애플리케이션>앱 설정>앱 키 : JAVASCRIPT KEY 입력하세요
//    SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());
</script>
<script type="text/javascript">
	function loginWithKakao() {
		Kakao.Auth.loginForm({
	        success: function (authObj) {
// 	            alert("login :" + JSON.stringify(authObj));
	            location.href="${pageContext.request.contextPath}/etf/etfBoard";
	        },
	        fail: function (err) {
	            alert(JSON.stringify(err))
	        },
	    })
	}
</script>

</head>
<body>

<!-- Header -->
	<jsp:include page="./include/header.jsp"></jsp:include>
<!-- Header -->
<div class="mb-4">
	<img class="mx-auto d-block container " src="${pageContext.request.contextPath}/resources/img/banner.jpg" >
</div>
<div class="container">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col" class="white-space text-center ">No.</th>
					<th scope="col" class="white-space text-center ">단축코드</th>
					<th scope="col" class="white-space text-center ">한글종목약명</th>					
					<th scope="col" class="white-space text-center ">기초지수명</th>
					<th scope="col" class="white-space text-center ">기초시장</th>
					<th scope="col" class="white-space text-center ">기초자산</th>
					<th scope="col" class="white-space text-center ">상장일</th>
				</tr>
			</thead>


			<tbody>
				<c:forEach var="EtfDTO" items="${ getetf }" varStatus="status">
					<tr>
						<th scope="row" class="f15 text-center border-end">${status.count }</th>
						<td class="white-space f15 text-center border-end">${ EtfDTO.ETF_code }</td>
						<td class="white-space f15 border-end">${ EtfDTO.ETF_name }</td>						
						<td class="white-space f15 border-end">${ EtfDTO.ETF_index } </td>
						<td class="white-space f15 text-center border-end">${ EtfDTO.market }</td>
						<td class="white-space f15 text-center border-end">${ EtfDTO.assets }</td>
						<td class="white-space f15 text-center border-end"><fmt:formatDate pattern="yyyy-MM-dd" value="${ EtfDTO.ETF_date }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
