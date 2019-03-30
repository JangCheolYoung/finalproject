package dto;

public class ItemDTO {
	private String item_title;
	private int item_price;
	private String item_addition;
	private String item_thumbnail;
	private String item_category;
	private String item_unit;
	private String item_stock;
	private String item_key;

	public String getitem_namekey() {
		return item_key;
	}

	public void setitem_namekey(String item_namekey) {
		this.item_key = item_namekey;
	}

	public String getitem_unit() {
		return item_unit;
	}

	public void setitem_unit(String item_unit) {
		this.item_unit = item_unit;
	}

	public String getitem_stock() {
		return item_stock;
	}

	public void setitem_stock(String item_stock) {
		this.item_stock = item_stock;
	}

	public String getitem_title() {
		return item_title;
	}

	public void setitem_title(String item_title) {
		this.item_title = item_title;
	}

	public int getitem_price() {
		return item_price;
	}

	public void setitem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getitem_addition() {
		return item_addition;
	}

	public void setitem_addition(String item_addtion) {
		this.item_addition = item_addtion;
	}

	public String getitem_thumbnail() {
		return item_thumbnail;
	}

	public void setitem_thumbnail(String item_thumbnail) {
		this.item_thumbnail = item_thumbnail;
	}

	public String getitem_category() {
		return item_category;
	}

	public void setitem_category(String item_category) {
		this.item_category = item_category;
	}

}
