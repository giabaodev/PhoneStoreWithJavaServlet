<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Header-->
<jsp:include page="Header.jsp"></jsp:include>
</head>
<body>

	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5 my-5">
		<div class="row align-items-center col-12"></div>
		<div class="col mb-2">
			<div class="row">
				<span style="margin-bottom: 430px;">
					<h4>
						Đặt hàng thành công đơn hàng dự kiến giao đến <c:out value="${diachi }"></c:out> trong vòng 4 đến 5 ngày
					</h4>
				</span>
				<div class="col-sm-12 col-md-6" style="margin: auto;">
					<a href='<c:url value="/trang-chu"/>'
						class="btn btn-block btn-light">Tiếp tục mua sắm</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<jsp:include page="Footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<script src="<c:url value='/templates/web/scripts.js'/>"></script>
	<script src="<c:url value='/templates/web/jquery.twbsPagination.js'/>"
		type="text/javascript"></script>
</body>
</html>
