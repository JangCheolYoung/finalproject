package dto;

public class CartDTO {
	private int cart_num;
	private int item_num;
	private int option_num;
	private String member_id;
	private int cart_amount;
	private int cart_price;

	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public int getOption_num() {
		return option_num;
	}

	public void setOption_num(int option_num) {
		this.option_num = option_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}

}
