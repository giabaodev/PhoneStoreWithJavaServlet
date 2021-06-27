<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/templates/admin" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Thêm mới sản phẩm</title>
<link href="${url}/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<!---------------------Navigation--------------------->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!---------------------Navigation--------------------->

	<div id="layoutSidenav">

		<!---------------------Menu--------------------->
		<jsp:include page="Menu.jsp"></jsp:include>
		<!---------------------Menu--------------------->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<div class="form-input-header">
						<h4>Thêm sản phẩm</h4>
					</div>
					<form method="post"
						style="width: 40%; margin: auto; padding: 20px; border: 1px solid black; background: gray; border-radius: 10px 10px 10px 10px; font-size: 16px;">
						<div class="form-input-body">
							<label>Loại sản phẩm</label> <select name="loai"
								required>
								<c:forEach items="${theLoais}" var="theLoais">
									<option value="${theLoais.idTheLoai}">${theLoais.tenLoai}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-input-body">
							<label>Tên sản phẩm</label> <input type="text" name="tensp"
								placeholder="Nhập tên..." required>
						</div>
						<div class="form-input-body">
							<label>Số lượng</label> <input type="text" name="sl"
								placeholder="Số lượng..." required>
						</div>
						<div class="form-input-body">
							<label>Mô tả</label> <input type="text" name="mota"
								placeholder="Mô tả sản phẩm..." required>
						</div>
						<div class="form-input-body">
							<label>Giá bán</label> <input type="text" name="gia"
								placeholder="Giá sản phẩm..." required>
						</div>
						<div class="form-input-body">
							<label>Hình ảnh</label> <input type="file" name="anh" required>
						</div>
						<div class="form-input-body">
							<input type="submit" value="Thêm mới" class="mt-4"
								style="width: 20%; margin-left: 40%;">
						</div>
					</form>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${url}/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${url}/assets/demo/chart-area-demo.js"></script>
	<script src="${url}/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${url}/assets/demo/datatables-demo.js"></script>
</body>
</html>
