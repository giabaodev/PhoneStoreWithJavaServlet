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
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row align-items-center">
				<c:forEach items="${sanPhams }" var="sanPhams">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0"
							src="${sanPhams.hinhanh }" alt="..." />
					</div>
					<div class="col-md-6">
						<div class="small mb-1">
							Mã sản phẩm:
							<c:out value="${sanPhams.idsanpham }"></c:out>
						</div>
						<h1 style="font-weight: bolder;">
							<c:out value="${sanPhams.tensanpham }"></c:out>
						</h1>
						<div class="mb-5" style="font-size: 1.25rem;">
							<span>$<c:out value="${sanPhams.giaban }"></c:out></span>
						</div>
						<p class="lead">
							<c:out value="${sanPhams.motasp }"></c:out>
						</p>
						<div class="d-flex">
							<input class="form-control text-center mr-3" id="inputQuantity"
								type="num" value="1" style="max-width: 3rem" />
							<a class="btn btn-outline-dark flex-shrink-0" type="button" href="${pageContext.request.contextPath }/gio-hang?action=themvaogio&id=${sanPhams.idsanpham}&page=giohang">
								<i class="bi-cart-fill mr-1"></i> Add to cart
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
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

	<script type="text/javascript">
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 5,
				visiblePages : 2,
				startPage : 1,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	</script>
</body>
</html>
