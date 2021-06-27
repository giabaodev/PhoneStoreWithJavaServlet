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
import com.phonestore.model.Kiemtradonhang;

@WebServlet(urlPatterns = { "/admin-kiemtra" })
public class ChiTietDonHang extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession httpSession;
	ArrayList<Kiemtradonhang> kiemtradonhang = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String getid = request.getParameter("iddonhang");
		int id = Integer.parseInt(getid);
		JDBCConnection jdbcConnection = new JDBCConnection();
		try {
			kiemtradonhang = jdbcConnection.kiemtra(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		httpSession = request.getSession();
		httpSession.setAttribute("kiemtradonhang", kiemtradonhang);
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/CTDH.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
