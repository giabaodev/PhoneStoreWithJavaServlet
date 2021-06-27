<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-3">
	<div class="my-4">
		<form action="<c:url value='/search'/>" method="get">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Tìm kiếm..."
					name="name" aria-label="Search" aria-describedby="b asic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<input type="hidden" value="search">
		</form>
	</div>
	<div class="list-group">
		<a href='<c:url value="/phones"/>' class="list-group-item" style="text-decoration: none;"> <img
			src="image/sanpham/cell-phone.png"> Phones
		</a> <a href='<c:url value="/accessories"/>' class="list-group-item" style="text-decoration: none;">
			<img src="image/sanpham/Usb-Cable-icon.png"> Phụ kiện
		</a> <a href='<c:url value="/laptop-tablet"/>' class="list-group-item" style="text-decoration: none;">
			<img src="image/sanpham/laptop-icon.png"> Laptop, Tablet
		</a>
	</div>
</div>