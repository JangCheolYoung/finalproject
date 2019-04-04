package dto;

import java.util.Date;

public class OrderDTO {
	private long order_num;
	private int order_amount;
	private int total_price;
	private int order_fullprice;
	private int order_usemileage;
	private int order_plusmileage;
	private String option_key;
	private String item_key;
	private String member_id;
	private String order_method;
	private String order_status;
	private String address;
	private String address_detail;
	private String receiver_name;
	private String receiver_tel;
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_tel() {
		return receiver_tel;
	}

	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}

	private Date order_date;

	public Date getOrder_date() {
		return order_date;
	}

	public int getOrder_fullprice() {
		return order_fullprice;
	}

	public void setOrder_fullprice(int order_fullprice) {
		this.order_fullprice = order_fullprice;
	}

	public int getOrder_usemileage() {
		return order_usemileage;
	}

	public void setOrder_usemileage(int order_usemileage) {
		this.order_usemileage = order_usemileage;
	}
	
	public int getOrder_plusmileage() {
		return order_plusmileage;
	}

	public void setOrder_plusmileage(int order_plusmileage) {
		this.order_plusmileage = order_plusmileage;
	}
	
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public long getOrder_num() {
		return order_num;
	}

	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getOption_key() {
		return option_key;
	}

	public void setOption_key(String option_key) {
		this.option_key = option_key;
	}

	public String getItem_key() {
		return item_key;
	}

	public void setItem_key(String item_key) {
		this.item_key = item_key;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getOrder_method() {
		return order_method;
	}

	public void setOrder_method(String order_method) {
		this.order_method = order_method;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

}
