<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/image/contact" var="url"></c:url>

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
				<form class="col-md-12" method="post"
					style="margin-top: 20px; padding: 0 !important">
					<select style="border-radius: 5px 5px 5px 5px;" name = "sapxep">
						<option value="giathap">Sắp xếp theo: Giá thấp xuống cao</option>
						<option value="giacao">Sắp xếp theo: Giá cao xuống thấp</option>
					</select> <input
						style="border-radius: 5px 5px 5px 5px; background-color: #d3dbd0;"
						type="submit" value="Lọc">
				</form>
				<div class="row my-4">
					<c:forEach items="${sanpham }" var="sanPhams">
						<c:if test="${sanPhams.getLoaisp() == 2 }">
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card h-100">
									<a
										href="${pageContext.request.contextPath }/details?id=${sanPhams.idsanpham}"><img
										class="card-img-top" src="${sanPhams.getHinhanh() }" alt="..." /></a>
									<div class="card-body">
										<h5 class="card-title">
											<a
												href="${pageContext.request.contextPath }/details?id=${sanPhams.idsanpham}"><c:out
													value="${sanPhams.getTensanpham() }"></c:out></a>
										</h5>
										<h5 style="color: #ed3621; text-align: center;">
											$
											<c:out value="${sanPhams.getGiaban() }"></c:out>
										</h5>

									</div>
									<a
										href="${pageContext.request.contextPath }/gio-hang?action=themvaogio&id=${sanPhams.idsanpham}&page=listpk"
										type="button"
										style="padding: 0.75rem 1.25rem; background-color: #ff0000; border-top: 1px solid rgba(0, 0, 0, 0.125); text-align: center; text-decoration: none; font-weight: bold; color: #000000;">ADD
										TO CART</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="row" style="margin-left: 300px; margin-right: 300px;">
					<ul style="align-content: center;" class="pagination"
						id="pagination"></ul>
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

	<script type="text/javascript">
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 1,
				visiblePages : 1,
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
