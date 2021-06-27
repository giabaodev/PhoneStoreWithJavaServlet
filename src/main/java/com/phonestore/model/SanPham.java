package com.phonestore.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class SanPham implements Comparable<SanPham> {
	private int idsanpham;
	private String tensanpham;
	private int loaisp;
	private String motasp;
	private int soluong;
	private int giaban;
	private String hinhanh;

	public int getIdsanpham() {
		return idsanpham;
	}

	public void setIdsanpham(int idsanpham) {
		this.idsanpham = idsanpham;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public int getLoaisp() {
		return loaisp;
	}

	public void setLoaisp(int loaisp) {
		this.loaisp = loaisp;
	}

	public String getMotasp() {
		return motasp;
	}

	public void setMotasp(String motasp) {
		this.motasp = motasp;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public int getGiaban() {
		return giaban;
	}

	public void setGiaban(int giaban) {
		this.giaban = giaban;
	}

	@Override
	public String toString() {
		return "SanPham [idsanpham=" + idsanpham + ", tensanpham=" + tensanpham + ", loaisp=" + loaisp + ", motasp="
				+ motasp + ", soluong=" + soluong + ", giaban=" + giaban + ", hinhanh=" + hinhanh + "]";
	}

	public ArrayList<String> Xoaitem(ArrayList<String> item, String id) {
		for (String iditem : item) {
			if (iditem.equals(id)) {
				item.remove(iditem);
				break;
			}
		}
		return item;
	}

	public boolean kiemtratontai(ArrayList<String> item, String idget) {
		for (String id : item) {
			if (id.equals(idget))
				return true;
		}
		return false;
	}

	public ArrayList<SanPham> giathap(ArrayList<SanPham> dssp) {
		Collections.sort(dssp);
		return dssp;
	}

	@Override
	public int compareTo(SanPham sanPham) {
		return (this.giaban) - (sanPham.giaban);
	}

	public ArrayList<SanPham> giacao(ArrayList<SanPham> dssp) {
		Collections.sort(dssp, new BienTam());
		return dssp;
	}

	class BienTam implements Comparator<SanPham> {
		@Override
		public int compare(SanPham sp1, SanPham sp2) {
			return (sp2.getGiaban()) - (sp1.getGiaban());
		}
	}
}