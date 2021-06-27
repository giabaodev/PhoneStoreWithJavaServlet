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
<title>Dashboard - SB Admin</title>
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
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> Chi tiết đơn hàng
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID sản phẩm</th>
											<th>Ảnh sản phẩm</th>
											<th>Tên sản phẩm</th>
											<th>Giá bán</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="kiemtradonhang" items="${kiemtradonhang }">
											<tr>
												<td><c:out value="${kiemtradonhang.iddonhang }"></c:out></td>
												<td><img alt="" src="${kiemtradonhang.hinhanh }" width="50"
											height="50"></td>
												<td><c:out value="${kiemtradonhang.tensanpham }"></c:out></td>
												<td>$<c:out value="${kiemtradonhang.giaban }"></c:out></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
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
