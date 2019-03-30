package dto;

public class CardDTO {
	private int card_num_seq; // 시퀸스
	private String card_title;
	private int card_number; // 카드 번호
	private int card_password;
	private int card_exp_month;
	private int card_exp_year;
	private int card_birthday;
	private String member_id;
	
	public CardDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCard_num_seq() {
		return card_num_seq;
	}

	public void setCard_num_seq(int card_num_seq) {
		this.card_num_seq = card_num_seq;
	}

	public String getCard_title() {
		return card_title;
	}

	public void setCard_title(String card_title) {
		this.card_title = card_title;
	}

	public int getCard_number() {
		return card_number;
	}

	public void setCard_number(int card_number) {
		this.card_number = card_number;
	}

	public int getCard_password() {
		return card_password;
	}

	public void setCard_password(int card_password) {
		this.card_password = card_password;
	}

	public int getCard_exp_month() {
		return card_exp_month;
	}

	public void setCard_exp_month(int card_exp_month) {
		this.card_exp_month = card_exp_month;
	}

	public int getCard_exp_year() {
		return card_exp_year;
	}

	public void setCard_exp_year(int card_exp_year) {
		this.card_exp_year = card_exp_year;
	}

	public int getCard_birthday() {
		return card_birthday;
	}

	public void setCard_birthday(int card_birthday) {
		this.card_birthday = card_birthday;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
