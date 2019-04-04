package dto;

import java.util.Date;

public class MemberDTO {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_tel;
	private Date join_date;
	private int member_mileage;

	public int getMember_mileage() {
		return member_mileage;
	}

	public void setMember_mileage(int member_mileage) {
		this.member_mileage = member_mileage;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

}
