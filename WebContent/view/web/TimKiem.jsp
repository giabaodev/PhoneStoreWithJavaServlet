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
	<div class="container">
		<div class="row">
			<jsp:include page="Menu.jsp"></jsp:include>

			<div class="col-lg-9">
				<div class="my-5"></div>
				<div class="row">
					<c:forEach items="${sanPhams }" var="sanPhams">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="${pageContext.request.contextPath }/details?id=${sanPhams.idsanpham}"><img class="card-img-top"
									src="${sanPhams.getHinhanh() }" alt="..." /></a>
								<div class="card-body">
									<h5 class="card-title">
										<a href="${pageContext.request.contextPath }/details?id=${sanPhams.idsanpham}"><c:out value="${sanPhams.getTensanpham() }"></c:out></a>
									</h5>
									<h5 style="color: #ed3621;">
										$
										<c:out value="${sanPhams.getGiaban() }"></c:out>
									</h5>
								</div>
								<a href="${pageContext.request.contextPath }/gio-hang?action=themvaogio&id=${sanPhams.idsanpham}&page=giohang" type="button"
									style="padding: 0.75rem 1.25rem; background-color: #ff0000; border-top: 1px solid rgba(0, 0, 0, 0.125); text-align: center; text-decoration: none; font-weight: bold; color: #000000;">ADD
									TO CART</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; NGB 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/templates/web/scripts.js'/>"></script>
</body>
</html>
