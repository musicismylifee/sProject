package com.myshop.vo;

public class MyshopOrderVO {
	int oid, pid, quantity, price, status, category_id,statuscount;
	String id,  odate, recipient_zonecode, recipient_addr, recipient_name,
	recipient_hp, recipient_pnumber, oddr, payment, pname, brand, psfile, rid;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getStatuscount() {
		return statuscount;
	}
	public void setStatuscount(int statuscount) {
		this.statuscount = statuscount;
	}
	public int getPrice() {
		return price;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPsfile() {
		return psfile;
	}
	public void setPsfile(String psfile) {
		this.psfile = psfile;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getRecipient_zonecode() {
		return recipient_zonecode;
	}
	public void setRecipient_zonecode(String recipient_zonecode) {
		this.recipient_zonecode = recipient_zonecode;
	}
	public String getRecipient_addr() {
		return recipient_addr;
	}
	public void setRecipient_addr(String recipient_addr) {
		this.recipient_addr = recipient_addr;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getRecipient_hp() {
		return recipient_hp;
	}
	public void setRecipient_hp(String recipient_hp) {
		this.recipient_hp = recipient_hp;
	}
	public String getRecipient_pnumber() {
		return recipient_pnumber;
	}
	public void setRecipient_pnumber(String recipient_pnumber) {
		this.recipient_pnumber = recipient_pnumber;
	}
	public String getOddr() {
		return oddr;
	}
	public void setOddr(String oddr) {
		this.oddr = oddr;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
}
