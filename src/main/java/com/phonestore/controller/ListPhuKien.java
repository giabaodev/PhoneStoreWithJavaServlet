package com.phonestore.controller;

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
import com.phonestore.model.SanPham;

@WebServlet(urlPatterns = { "/accessories" })
public class ListPhuKien extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession httpSession;
	ArrayList<SanPham> sanPhams = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JDBCConnection jdbcConnection = new JDBCConnection();
		try {
			sanPhams = jdbcConnection.getSanPhams();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		httpSession = request.getSession();
		httpSession.setAttribute("sanpham", sanPhams);
		RequestDispatcher rd = request.getRequestDispatcher("/view/web/ListPhuKien.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("sapxep");
		SanPham sanPham = new SanPham();
		if (action.equals("giathap")) {
			sanPhams = sanPham.giathap(sanPhams);
		}
		if(action.equals("giacao"))
			sanPhams = sanPham.giacao(sanPhams);
		request.setAttribute("sanPhams", sanPhams);
		RequestDispatcher rd = request.getRequestDispatcher("/view/web/ListPhuKien.jsp");
		rd.forward(request, response);
	}
}
