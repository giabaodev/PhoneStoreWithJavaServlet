package com.phonestore.controller;

import java.io.IOException;
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

@WebServlet(urlPatterns = { "/search" })
public class TimKiemTheoTen extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ArrayList<SanPham> sanPhams = new ArrayList<>();
	HttpSession httpSession;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		JDBCConnection jdbcConnection = new JDBCConnection();
		sanPhams = jdbcConnection.seachByName(name);
		httpSession = request.getSession();
		httpSession.setAttribute("sanPhams", sanPhams);
		RequestDispatcher rd = request.getRequestDispatcher("/view/web/TimKiem.jsp");
		rd.forward(request, response);
	}

}
