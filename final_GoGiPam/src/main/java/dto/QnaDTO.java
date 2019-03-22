package dto;

import java.util.Date;


import org.springframework.web.multipart.MultipartFile;

public class QnaDTO {
	private String member_id;
	private int question_num;
	private String question_title;
	private String question_content;
	private String question_file;
	private Date question_date;
	private String hasAnswer;
	
	
	private String upload;
	private MultipartFile filename;



	public MultipartFile getFilename() {
		return filename;
	}


	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}


	public QnaDTO() {
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getQuestion_num() {
		return question_num;
	}


	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}


	public String getQuestion_title() {
		return question_title;
	}


	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}


	public String getQuestion_content() {
		return question_content;
	}


	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}


	public String getQuestion_file() {
		return question_file;
	}


	public void setQuestion_file(String question_file) {
		this.question_file = question_file;
	}


	public Date getQuestion_date() {
		return question_date;
	}


	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}


	public String getHasAnswer() {
		return hasAnswer;
	}


	public void setHasAnswer(String hasAnswer) {
		this.hasAnswer = hasAnswer;
	}


	public String getUpload() {
		return upload;
	}


	public void setUpload(String upload) {
		this.upload = upload;
	}

	
}
