<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-red">
	<div class="container">
		<a class="navbar-brand" href='<c:url value="/trang-chu"/>'>BHT
			Store</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<c:set var="sl" value="0"></c:set>
			<c:forEach items="${giohang }" var="gio">
				<c:set var="sl" value="${sl+1 }"></c:set>
			</c:forEach>

			<form class="d-flex navbar-nav ml-auto" >
				<a class="btn btn-outline-white" type="button" href="${pageContext.request.contextPath }/gio-hang?action=show"> <i class="bi-cart-fill me-1"></i>
					Giỏ <span class="badge bg-white text-dark ms-1 rounded-pill"><c:out
							value="${sl}" /></span>
				</a>
			</form>
		</div>
	</div>
</nav>
