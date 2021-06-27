<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/templates/login" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${url }/loginstyle.css">

</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">PhoneStore Management</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-5">
					<div class="login-wrap p-4 p-md-5">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="fa fa-user-o"></span>
						</div>
						<h3 class="text-center mb-4">Nhập tài khoản người quản lý</h3>
						<form class="login-form" method="post">
							<div class="form-group">
								<input type="text" class="form-control rounded-left"
									name="username" placeholder="Username" required>
							</div>
							<div class="form-group d-flex">
								<input type="password" class="form-control rounded-left"
									name="password" placeholder="Password" required>
							</div>
							<font color="#F24638"><c:out value="${message }"></c:out></font>

							<div class="form-group">
								<button type="submit" name="dangnhap"
									class="btn btn-primary rounded submit p-3 px-5">Đăng
									nhập</button>
							</div>
							<input type="hidden" name="action" value="dang-nhap">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${url }/jquery.min.js"></script>
	<script src="${url }/popper.js"></script>
	<script src="${url }/bootstrap.min.js"></script>
	<script src="${url }/main.js"></script>

</body>
</html>