package com.phonestore.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.phonestore.dao.JDBCConnection;
import com.phonestore.model.DonHang;

@WebServlet(urlPatterns = { "/admin-ordermanagement" })
public class DanhSachDonHang extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession httpSession;
	ArrayList<DonHang> donHangs = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JDBCConnection jdbcConnection = new JDBCConnection();
		try {
			donHangs = jdbcConnection.getDonHangs();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		httpSession = request.getSession();
		httpSession.setAttribute("donHangs", donHangs);
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/DSDH.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
