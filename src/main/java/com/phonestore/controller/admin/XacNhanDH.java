package com.phonestore.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.phonestore.dao.JDBCConnection;
import com.phonestore.model.DonHang;
import com.phonestore.model.SanPham;
import com.phonestore.model.TheLoai;

@WebServlet(urlPatterns = {"/admin-xacnhan"})
public class XacNhanDH extends HttpServlet{
	/**
	 * 
	 */
	ArrayList<TheLoai> theLoais = new ArrayList<>();
	ArrayList<SanPham> sanPhams = new ArrayList<>();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("iddonhang");
		DonHang donHang = new DonHang();
		donHang.setIddonhang(Integer.parseInt(id));
		JDBCConnection connection = new JDBCConnection();
		try {
			connection.capnhatdonhang(donHang);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/admin-ordermanagement");
	}
}
