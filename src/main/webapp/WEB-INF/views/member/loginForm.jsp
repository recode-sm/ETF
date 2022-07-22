<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS only -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/signin.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body class="text-center">
    
<main class="form-signin">
	<a href="${pageContext.request.contextPath}/">
		<img class="mb-4" src="${pageContext.request.contextPath}/resources/img/logo.png" height="57">
	</a>
  <form action="${pageContext.request.contextPath}/member/loginPro" method="post">    
      <input type="text" name="id" class="form-control form-floating"  id="floatingInput" placeholder="아이디" style="height: 54px; font-size: 20px; ">

      <input type="password" name="pass" class="form-control form-floating" id="floatingPassword" placeholder="비밀번호" style="height: 54px; font-size: 20px;">


    <div class="checkbox mb-3">
<!--       <label> -->
<!--         <input type="checkbox" value="remember-me"> Remember me -->
<!--       </label> -->
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
  </form>
</main>


    
  

</body>
</html>