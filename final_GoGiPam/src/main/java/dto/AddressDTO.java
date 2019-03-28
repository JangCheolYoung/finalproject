package dto;

public class AddressDTO {
	private int address_num;
	private String member_id;
	private String post_num;
	private String address;
	private String address_detail;
	private String receiver_name;
	private String receiver_tel;
	private int address_default;

	public AddressDTO() {
		
	}
	
	public int getAddress_num() {
		return address_num;
	}

	public void setAddress_num(int address_num) {
		this.address_num = address_num;
	}

	public int getAddress_default() {
		return address_default;
	}

	public void setAddress_default(int address_defalut) {
		this.address_default = address_defalut;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPost_num() {
		return post_num;
	}

	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}

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

}
