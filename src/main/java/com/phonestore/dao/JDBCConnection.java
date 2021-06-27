package com.phonestore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.phonestore.model.CTDonHang;
import com.phonestore.model.DonHang;
import com.phonestore.model.Kiemtradonhang;
import com.phonestore.model.SanPham;
import com.phonestore.model.TheLoai;

public class JDBCConnection {
	String USER = "root";
	String PASS = "giabao";
	String URL = "jdbc:mysql://localhost:3306/phonestore";

	private Connection connection = null;

	protected Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USER, PASS);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	/*
	 * private void Connect() { try { Class.forName("com.mysql.cj.jdbc.Driver");
	 * connection = DriverManager.getConnection(URL, USER, PASS); } catch (Exception
	 * e) { } }
	 */

	private void Close() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	ArrayList<TheLoai> danhsachTheLoais = new ArrayList<>();

	public ArrayList<TheLoai> getTheLoais() throws SQLException {
		getConnection();
		String sql = "Select * from theloai";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			int id = resultSet.getInt("idTheLoai");
			String tenloai = resultSet.getString("TenLoai");

			TheLoai theLoai = new TheLoai();
			theLoai.setIdTheLoai(id);
			theLoai.setTenLoai(tenloai);
			danhsachTheLoais.add(theLoai);
			theLoai = null;
		}
		Close();
		return danhsachTheLoais;
	}

	public ArrayList<TheLoai> Timkiemloai(int idTheLoai) {
		getConnection();
		String sql = "SELECT * FROM theloai WHERE idTheLoai = ? ";
		PreparedStatement statement;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, idTheLoai);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				TheLoai theLoai = new TheLoai();
				theLoai.setIdTheLoai(rs.getInt("idTheLoai"));
				theLoai.setTenLoai(rs.getString("TenLoai"));

				danhsachTheLoais.add(theLoai);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Close();
		return danhsachTheLoais;
	}

	ArrayList<SanPham> danhsachSanPhams = new ArrayList<>();

	public ArrayList<SanPham> getSanPhams() throws SQLException {
		getConnection();
		String sql = "Select * from sanpham";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("idsanpham");
			String ten = rs.getString("tensanpham");
			int loai = rs.getInt("loaisp");
			String mota = rs.getString("motasp");
			int sl = rs.getInt("soluong");
			int giaban = rs.getInt("giaban");
			String hinhanh = rs.getString("hinhanh");

			SanPham sanPham = new SanPham();
			sanPham.setIdsanpham(id);
			sanPham.setTensanpham(ten);
			sanPham.setLoaisp(loai);
			sanPham.setMotasp(mota);
			sanPham.setSoluong(sl);
			sanPham.setGiaban(giaban);
			sanPham.setHinhanh(hinhanh);
			danhsachSanPhams.add(sanPham);
			sanPham = null;

		}
		Close();
		return danhsachSanPhams;
	}

	ArrayList<DonHang> danhsachDonHangs = new ArrayList<>();

	public ArrayList<DonHang> getDonHangs() throws SQLException {
		getConnection();
		String sql = "select * from donhang";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("iddonhang");
			String hoten = rs.getString("hoten");
			String sdt = rs.getString("sdt");
			String diachi = rs.getString("diachi");
			String ngaydh = rs.getString("ngaydathang");
			int tongtien = rs.getInt("tongtien");
			String tt = rs.getString("trangthai");
			DonHang donHang = new DonHang();
			donHang.setIddonhang(id);
			donHang.setHoten(hoten);
			donHang.setSdt(sdt);
			donHang.setDiachi(diachi);
			donHang.setNgaydathang(ngaydh);
			donHang.setTongtien(tongtien);
			donHang.setTrangthai(tt);
			danhsachDonHangs.add(donHang);
			donHang = null;
		}
		Close();
		return danhsachDonHangs;
	}

	public void themdonhang(DonHang dh) throws SQLException {
		getConnection();
		String sql = "Insert into donhang(iddonhang,hoten,ngaydathang,sdt,diachi,tongtien,trangthai) values(?,?,?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setInt(1, dh.getIddonhang());
		statement.setString(2, dh.getHoten());
		statement.setString(3, dh.getNgaydathang());
		statement.setString(4, dh.getSdt());
		statement.setString(5, dh.getDiachi());
		statement.setInt(6, dh.getTongtien());
		statement.setString(7, dh.getTrangthai());
		statement.executeUpdate();
		Close();
	}

	public boolean kiemtradonhang(int iddonhang) throws SQLException {
		getConnection();
		int count = 0;
		String sql = "Select * from donhang where iddonhang = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, iddonhang);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			count = 1;
		}
		Close();
		if (count == 0)
			return false;
		return true;
	}

	public void themchitietdonhang(CTDonHang ctDonHang) throws SQLException {
		getConnection();
		String sql = "Insert into chitietdonhang(iddonhang,idsanpham) values(?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, ctDonHang.getIddonhang());
		statement.setInt(2, ctDonHang.getIdsanpham());
		statement.executeUpdate();
		Close();
	}

	public void capnhatdonhang(DonHang dh) throws SQLException {
		getConnection();
		String sql = "UPDATE donhang set trangthai = 'Done' WHERE iddonhang = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, dh.getIddonhang());
		statement.executeUpdate();
		Close();
	}

	public ArrayList<Kiemtradonhang> kiemtra(int iddonhang) throws SQLException {
		getConnection();
		ArrayList<Kiemtradonhang> kiemtradonhangs = new ArrayList<>();
		String sql = "select chitietdonhang.iddonhang, sanpham.hinhanh, sanpham.tensanpham, sanpham.giaban\r\n"
				+ "from chitietdonhang, sanpham\r\n"
				+ "where chitietdonhang.idsanpham = sanpham.idsanpham and iddonhang = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, iddonhang);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("iddonhang");
			String hinhanh = rs.getString("hinhanh");
			String tensanpham = rs.getString("tensanpham");
			int giaban = rs.getInt("giaban");
			Kiemtradonhang kt = new Kiemtradonhang();
			kt.setIddonhang(id);
			kt.setHinhanh(hinhanh);
			kt.setTensanpham(tensanpham);
			kt.setGiaban(giaban);
			kiemtradonhangs.add(kt);
			kt = null;
		}
		Close();
		return kiemtradonhangs;
	}

	public ArrayList<SanPham> seachByName(String tenSanPham) {
		getConnection();
		String sql = "SELECT * FROM sanpham WHERE tensanpham like ? ";
		PreparedStatement statement;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, "%" + tenSanPham + "%");
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdsanpham(rs.getInt("idsanpham"));
				sanPham.setTensanpham(rs.getString("tensanpham"));
				sanPham.setLoaisp(rs.getInt("loaisp"));
				sanPham.setMotasp(rs.getString("motasp"));
				sanPham.setSoluong(rs.getInt("soluong"));
				sanPham.setGiaban(rs.getInt("giaban"));
				sanPham.setHinhanh(rs.getString("hinhanh"));
				danhsachSanPhams.add(sanPham);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Close();
		return danhsachSanPhams;
	}

	public ArrayList<SanPham> seachByID(int idsanpham) {
		getConnection();
		String sql = "SELECT * FROM sanpham WHERE idsanpham = ? ";
		PreparedStatement statement;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, idsanpham);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdsanpham(rs.getInt("idsanpham"));
				sanPham.setTensanpham(rs.getString("tensanpham"));
				sanPham.setLoaisp(rs.getInt("loaisp"));
				sanPham.setMotasp(rs.getString("motasp"));
				sanPham.setSoluong(rs.getInt("soluong"));
				sanPham.setGiaban(rs.getInt("giaban"));
				sanPham.setHinhanh(rs.getString("hinhanh"));
				danhsachSanPhams.add(sanPham);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Close();
		return danhsachSanPhams;
	}

	public void capnhatsp(SanPham sp) throws SQLException {
		getConnection();
		String sql = "UPDATE sanpham set tensanpham=?, loaisp=?, motasp=?, soluong=?, giaban=? where idsanpham=?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, sp.getTensanpham());
		statement.setInt(2, sp.getLoaisp());
		statement.setString(3, sp.getMotasp());
		statement.setInt(4, sp.getSoluong());
		statement.setInt(5, sp.getGiaban());
		statement.setInt(6, sp.getIdsanpham());
		statement.executeUpdate();
		Close();
	}

	public void themsp(SanPham sp) throws SQLException {
		getConnection();
		String sql = "Insert into sanpham(tensanpham,loaisp,motasp,soluong,giaban,hinhanh) values(?,?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, sp.getTensanpham());
		statement.setInt(2, sp.getLoaisp());
		statement.setString(3, sp.getMotasp());
		statement.setInt(4, sp.getSoluong());
		statement.setInt(5, sp.getGiaban());
		statement.setString(6, sp.getHinhanh());
		statement.executeUpdate();
		Close();
	}

	public void Xoasp(int idsanpham) {

		getConnection();
		String sql = "DELETE FROM sanpham where idsanpham=?";
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, idsanpham);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Close();

	}
}
