package model;

import java.util.Date;
import java.util.List;

public class Orders {
	private int orderID;
	private float price;
	private int status;
	private Date orderDate;
	private String address;
	private String phoneNumber;
	private List<ProductOrders> lp;
	private String userMail;
	private Date receiveDate;
	private String discount;

	public Orders() {
		super();
	}

	public Orders(int orderID, float price, int status, Date orderDate, String address, String phoneNumber,
			List<ProductOrders> lp, String userMail, Date receiveDate) {
		super();
		this.orderID = orderID;
		this.price = price;
		this.status = status;
		this.orderDate = orderDate;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.lp = lp;
		this.userMail = userMail;
		this.receiveDate = receiveDate;
	}

	public Orders(int status, Date orderDate, String address, String userMail, String discount) {
		super();
		this.status = status;
		this.orderDate = orderDate;
		this.address = address;
		this.userMail = userMail;
		this.discount = discount;
	}
	

	public Orders(String userMail, int orderID, int status, Date orderDate,String disccount, String address) {
		super();
		this.userMail = userMail;
		this.orderID = orderID;
		this.status = status;
		this.orderDate = orderDate;
		this.discount = disccount;
		this.address = address;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<ProductOrders> getLp() {
		return lp;
	}

	public void setLp(List<ProductOrders> lp) {
		this.lp = lp;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	@Override
	public String toString() {
		return "Orders [id=" + orderID + ", mail=" + userMail + ", status=" + status + ", date=" + orderDate + ", discount="
				+ discount + ", address=" + address  + "]";
	}

}
