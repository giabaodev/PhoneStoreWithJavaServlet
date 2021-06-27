package com.phonestore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.phonestore.dao.JDBCConnection;
import com.phonestore.model.CTDonHang;
import com.phonestore.model.DonHang;
import com.phonestore.model.SanPham;

@WebServlet(urlPatterns = { "/gio-hang" })
public class Giohang extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession httpSession;
	ArrayList<SanPham> sanPhams = new ArrayList<>();
	ArrayList<String> gio = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/view/web/GioHang.jsp");
			rd.forward(request, response);
		} else
			doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String page = request.getParameter("page");
		JDBCConnection jdbcConnection = new JDBCConnection();
		try {
			sanPhams = jdbcConnection.getSanPhams();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (action.equals("show")) {
			httpSession = request.getSession();
			httpSession.setAttribute("gio", gio);
			httpSession.setAttribute("sanPhams", sanPhams);
			RequestDispatcher rd = request.getRequestDispatcher("/view/web/GioHang.jsp");
			rd.forward(request, response);
		}
		if (action.equals("themvaogio")) {
			String id = request.getParameter("id");
			SanPham sanPham = new SanPham();
			boolean kiemtra = sanPham.kiemtratontai(gio, id);
			if (kiemtra) {
				JOptionPane.showMessageDialog(null, "San pham da o trong gio hang", "Info",
						JOptionPane.INFORMATION_MESSAGE);
				httpSession = request.getSession();
				httpSession.setAttribute("sanPhams", sanPhams);
				RequestDispatcher rd = request.getRequestDispatcher("/view/web/GioHang.jsp");
				rd.forward(request, response);
			} else {
				gio.add(id);
				if (page.equals("listphone")) {
					httpSession = request.getSession();
					httpSession.setAttribute("giohang", gio);
					RequestDispatcher rd = request.getRequestDispatcher("/view/web/ListPhone.jsp");
					rd.forward(request, response);
				}
				if (page.equals("listpk")) {
					httpSession = request.getSession();
					httpSession.setAttribute("giohang", gio);
					RequestDispatcher rd = request.getRequestDispatcher("/view/web/ListPhuKien.jsp");
					rd.forward(request, response);
				}
				if (page.equals("listlt")) {
					httpSession = request.getSession();
					httpSession.setAttribute("giohang", gio);
					RequestDispatcher rd = request.getRequestDispatcher("/view/web/ListLaptopTablet.jsp");
					rd.forward(request, response);
				}
				if (page.equals("giohang")) {
					httpSession = request.getSession();
					httpSession.setAttribute("giohang", gio);
					httpSession.setAttribute("sanPhams", sanPhams);
					RequestDispatcher rd = request.getRequestDispatcher("/view/web/GioHang.jsp");
					rd.forward(request, response);
				}
			}
		}
		if (action.equals("xoa")) {
			String id = request.getParameter("id");
			SanPham sanPham = new SanPham();
			gio = sanPham.Xoaitem(gio, id);
			httpSession = request.getSession();
			httpSession.setAttribute("giohang", gio);
			RequestDispatcher rd = request.getRequestDispatcher("/view/web/GioHang.jsp");
			rd.forward(request, response);
		}
		if (action.equals("checkout")) {
			httpSession = request.getSession();
			httpSession.setAttribute("gio", gio);
			httpSession.setAttribute("sanPhams", sanPhams);
			RequestDispatcher rd = request.getRequestDispatcher("/view/web/Checkout.jsp");
			rd.forward(request, response);
		}
		if (action.equals("xacnhan")) {

			int rdIDdonhang = ThreadLocalRandom.current().nextInt(10000000, 99999999);
			String hoten = request.getParameter("hoten");
			String sdt = request.getParameter("sdt");
			String diachi = request.getParameter("diachi");
			String tongtien = request.getParameter("tongtien");
//			System.out.println(hoten);
//			System.out.println(sdt);
//			System.out.println(diachi);
//			System.out.println(tongtien);
			JDBCConnection connection = new JDBCConnection();
			try {
				while (connection.kiemtradonhang(rdIDdonhang)) {
					rdIDdonhang = ThreadLocalRandom.current().nextInt(10000000, 99999999);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String ngaydathang = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
			
			DonHang donHang = new DonHang();
			donHang.setIddonhang(rdIDdonhang);
			donHang.setHoten(hoten);
			donHang.setDiachi(diachi);
			donHang.setNgaydathang(ngaydathang);
			donHang.setSdt(sdt);
			donHang.setTongtien(Integer.parseInt(tongtien));
			donHang.setTrangthai("Queue");
			try {
				connection.themdonhang(donHang);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			for (int i = 0; i < gio.size(); i++) {
				CTDonHang ctDonHang = new CTDonHang();
				int getid = Integer.parseInt(gio.get(i));
				ctDonHang.setIddonhang(rdIDdonhang);
				ctDonHang.setIdsanpham(getid);
				JDBCConnection addctdonhang = new JDBCConnection();
				try {
					addctdonhang.themchitietdonhang(ctDonHang);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			request.setAttribute("diachi", diachi);
			RequestDispatcher rd = request.getRequestDispatcher("/view/web/Success.jsp");
			rd.forward(request, response);
			gio.clear();
		}
	}
}
