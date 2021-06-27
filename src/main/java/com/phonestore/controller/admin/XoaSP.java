package com.phonestore.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.phonestore.dao.JDBCConnection;

@WebServlet(urlPatterns = { "/admin-delete" })
public class XoaSP extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idsanpham = request.getParameter("idsanpham");
		JDBCConnection jdbcConnection = new JDBCConnection();
		jdbcConnection.Xoasp(Integer.parseInt(idsanpham));
		JOptionPane.showMessageDialog(null, "Deleted", "Message", JOptionPane.INFORMATION_MESSAGE);
		response.sendRedirect(request.getContextPath() + "/admin-productsmanagement");
	}
}
