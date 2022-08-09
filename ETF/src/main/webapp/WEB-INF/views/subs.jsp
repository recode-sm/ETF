<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
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
	            alert("login :" + JSON.stringify(authObj));
	            //★ 추가 할 것 : 로그인 성공 후 처리 
	        },
	        fail: function (err) {
	            alert(JSON.stringify(err))
	        },
	    })
	}
</script>
</head>
<body>

</body>
</html>