package com.phonestore.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/admin" })
public class AdminHomeController extends HttpServlet {
	/**
	 * 
	 */
	HttpSession httpSession;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/view/admin/Login.jsp");
			rd.forward(request, response);
		} else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("dang-nhap")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (username.equals("admin") && password.equals("admin")) {
				request.getRequestDispatcher("/view/admin/Home.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "Sai username or password");
				request.setAttribute("username", username);
				request.getRequestDispatcher("/view/admin/Login.jsp").forward(request, response);
			}
		}
	}
}
