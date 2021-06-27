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
import javax.swing.JOptionPane;

import com.phonestore.dao.JDBCConnection;
import com.phonestore.model.SanPham;
import com.phonestore.model.TheLoai;

@WebServlet(urlPatterns = {"/admin-themsp"})
public class ThemSP extends HttpServlet{
	/**
	 * 
	 */
	ArrayList<TheLoai> theLoais = new ArrayList<>();
	ArrayList<SanPham> sanPhams = new ArrayList<>();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JDBCConnection jdbcConnection = new JDBCConnection();
		try {
			theLoais = jdbcConnection.getTheLoais();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("theLoais", theLoais);
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/ThemSP.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loai = request.getParameter("loai");
		String ten = request.getParameter("tensp");
		String gia = request.getParameter("gia");
		String mota = request.getParameter("mota");
		String sl = request.getParameter("sl");
		String hinhanh = request.getParameter("anh");
		SanPham sanPham = new SanPham();
		sanPham.setLoaisp(Integer.parseInt(loai));
		sanPham.setTensanpham(ten);
		sanPham.setMotasp(mota);
		sanPham.setSoluong(Integer.parseInt(sl));
		sanPham.setGiaban(Integer.parseInt(gia));
		sanPham.setHinhanh("image/sanpham/"+ hinhanh);
		
		JDBCConnection connection = new JDBCConnection();
		try {
			connection.themsp(sanPham);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JOptionPane.showMessageDialog(null, "ADDED", "Info", JOptionPane.INFORMATION_MESSAGE);
		doGet(request, response);
	}
}
