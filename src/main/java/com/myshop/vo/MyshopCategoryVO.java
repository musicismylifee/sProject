package com.myshop.vo;

import java.util.List;

public class MyshopCategoryVO {
	/*
	 * int lf, level,category_id, category_parent_id, category_dept; String
	 * group_id, category_nm;
	 */
	
	
	int dept_level,category_id,category_parent;
	String category_nm;
	@Override
	public String toString() {
		return "MyshopCategoryVO [dept_level=" + dept_level + ", category_id=" + category_id + ", category_parent="
				+ category_parent + ", category_nm=" + category_nm + "]";
	}
	public int getDept_level() {
		return dept_level;
	}
	public void setDept_level(int dept_level) {
		this.dept_level = dept_level;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getCategory_parent() {
		return category_parent;
	}
	public void setCategory_parent(int category_parent) {
		this.category_parent = category_parent;
	}
	public String getCategory_nm() {
		return category_nm;
	}
	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}
	
	
}
