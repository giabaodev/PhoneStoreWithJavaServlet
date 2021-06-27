<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/image/contact" var="url"></c:url>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Header-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="Header.jsp"></jsp:include>
<style>
.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin: 0 -16px;
}

* {
	box-sizing: border-box;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

input{
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn:hover {
	background-color: #45a049;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>
</head>
<body>
	<!-- Navigation-->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Page Content-->
	<div class="container"
		style="background-color: #f2f2f2; padding: 5px 20px 15px 20px; border: 1px solid lightgrey; border-radius: 3px;">
		<div class="row">
			<div class="col-75">
				<div class="container">
					<form method="post" action="<c:url value='/gio-hang'/>">
						<c:forEach items="${gio }" var="gio">
							<c:forEach items="${sanPhams }" var="sanPhams">
								<c:if test="${gio == sanPhams.idsanpham }">
									<c:choose>
										<c:when test="${sanPhams.soluong > 0}">
											<c:set var="tongtien" value="${tongtien + sanPhams.giaban }"></c:set>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
						</c:forEach>
						<div class="row">
							<div class="col-50">
								<h3>Thông tin thanh toán</h3>
								<label for="fname"><i class="fa fa-user"></i> Họ tên</label> 
								<input type="text" id="fname" name="hoten" required> 
								<label for="phonenumber"><i class=""></i> Số điện thoại</label> 
								<input type="text" id="sdt" name="sdt" required> 
								<label for="adr"><i class="fa fa-address-card-o"></i> Địa chỉ</label>
								<input type="text" id="adr" name="diachi" required> 
								<label for="city"><i class="fa fa-institution"></i> Tổng tiền</label>
								<strong>$<c:out value="${tongtien }"></c:out></strong>
							</div>
						</div>
						<input type="submit" value="Xác nhận đặt hàng"
							style="background-color: #04AA6D; color: white; padding: 12px; margin: 10px 0; border: none; width: 100%; border-radius: 3px; cursor: pointer; font-size: 17px;">
					<input type="hidden" name="action" value="xacnhan">
					<input type="hidden" name="tongtien" value="${tongtien }">
					</form>
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

	<script
		src="<c:url value='/templates/web/scripts.js'/>"></script>
	<script src="<c:url value='/templates/web/jquery.twbsPagination.js'/>"
		type="text/javascript"></script>
</body>
</html>
