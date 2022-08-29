package model;

public class ProductOrders {
	private int orderID;
	private int productID;
	private int amountProduct;
	private float priceProduct;

	public ProductOrders(int orderID, int productID, int amountProduct, float priceProduct) {
		super();
		this.orderID = orderID;
		this.productID = productID;
		this.amountProduct = amountProduct;
		this.priceProduct = priceProduct;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public int getAmountProduct() {
		return amountProduct;
	}

	public void setAmountProduct(int amountProduct) {
		this.amountProduct = amountProduct;
	}

	public double getPriceProduct() {
		return priceProduct;
	}

	public void setPriceProduct(float priceProduct) {
		this.priceProduct = priceProduct;
	}

	@Override
	public String toString() {
		return "ProductOrders [orderID=" + orderID + ", productID=" + productID + ", amountProduct=" + amountProduct
				+ ", nameProduct=" + "]";
	}

}
