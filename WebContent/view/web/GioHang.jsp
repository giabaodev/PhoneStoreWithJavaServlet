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
		<div class="row align-items-center col-12">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">Product</th>
							<th scope="col">Available</th>
							<th scope="col" class="text-center">Quantity</th>
							<th scope="col" class="text-right">Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="tongtien" value="0"></c:set>
						<c:forEach items="${gio }" var="gio">
							<c:forEach items="${sanPhams }" var="sanPhams">
								<c:if test="${gio == sanPhams.idsanpham }">
									<c:choose>
										<c:when test="${sanPhams.soluong > 0}">
											<c:set var="tongtien" value="${tongtien + sanPhams.giaban }"></c:set>
										</c:when>
									</c:choose>
									<tr>
										<td><img src="${sanPhams.hinhanh }" width="50"
											height="50" /></td>
										<td><c:out value="${sanPhams.tensanpham }"></c:out></td>
										<td><c:choose>
												<c:when test="${sanPhams.soluong > 0}">Còn hàng</c:when>
												<c:when test="${sanPhams.soluong < 1}">Hết hàng</c:when>
											</c:choose></td>
										<td class="align-items-center"><input
											class="form-control ml-5" type="text" value="1"
											style="max-width: 3rem" /></td>
										<td class="text-right">$<c:out
												value="${sanPhams.giaban }"></c:out></td>
										<td class="text-right"><a
											href="${pageContext.request.contextPath }/gio-hang?action=xoa&id=${sanPhams.idsanpham}"
											class="btn btn-sm btn-danger"> <i class="fa fa-trash"></i>
										</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><strong>Tổng cộng</strong></td>
							<td class="text-right"><strong>$<c:out
										value="${tongtien }"></c:out></strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col mb-2">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<a href='<c:url value="/trang-chu"/>'
						class="btn btn-block btn-light">Tiếp tục mua sắm</a>
				</div>
				<c:set var="sl" value="0"></c:set>
				<c:forEach items="${giohang }" var="gio">
					<c:set var="sl" value="${sl+1 }"></c:set>
				</c:forEach>
				<div class="col-sm-12 col-md-6 text-right">
					<c:if test="${sl > 0}">
						<a
							href="${pageContext.request.contextPath }/gio-hang?action=checkout"
							class="btn btn-lg btn-block btn-success text-uppercase">Thanh
							toán</a>
					</c:if>
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
