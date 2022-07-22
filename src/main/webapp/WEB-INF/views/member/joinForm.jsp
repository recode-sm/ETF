<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
﻿<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	},)
});
$(document).ready(function(){
	$('#join').submit(function(){
		if($('#pass').val()!=$('#pass_ck').val()){
			alert("비밀번호를 다시 확인해주세요");
			$('#pass_ck').focus();
			return false;
		}
	});
});
</script>
</head>
<body class="bg-light">

	<div class="container">
		<main>
			<div class="py-5 text-center ">
				<img class="d-block mx-auto mb-4"
					src="${pageContext.request.contextPath}/resources/img/user.svg"
					height="80">
				<!-- 				<h2>Checkout form</h2> -->

			</div>

			<div class="row g-5">

				<div class="col-4 mx-auto">
					<h4 class="mb-3">회원가입</h4>
					<form name="memberJoin" id="join" class="needs-validation" action="${pageContext.request.contextPath}/member/joinPro" method="post" novalidate>
						<div class="row g-3">
							<div class="col-12">
								<label for="id" class="form-label">아이디</label>
								<input type="text"	class="form-control " name="id" id="id" required minlength="5" autocomplete='off'>
								<div class="invalid-feedback">최소 5글자 이상 작성해 주세요.</div>
							</div>

							<div class="col-12">
								<label for="pass" class="form-label">비밀번호</label>
								<input type="password"	class="form-control" name="pass" id="pass" required 
											pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$">
								<div class="invalid-feedback">8~16자 사이 숫자, 영문자, 특수문자를 작성해 주세요.</div>
							</div>

							<div class="col-12">
								<label for="pass_ck" class="form-label">비밀번호 확인</label>
								<input type="password"	class="form-control" name="pass_ck" id="pass_ck" required 
											pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$">
								<div class="invalid-feedback">비밀번호를 다시 입력해 주세요.</div>
							</div>

							<div class="col-12">
								<label for="Kaid" class="form-label">카카오 ID</label>
								<input type="text"	class="form-control" name="kaid" id="kaid" required minlength="2" autocomplete='off'>
								<div class="invalid-feedback">최소 2글자 이상 작성해 주세요.</div>
							</div>											
												
						</div>

						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg" type="submit">가입</button>
					</form>
				</div>
			</div>
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2017–2022 Company Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>


</body>
</html>