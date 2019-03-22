package dto;

public class FaqDTO {
	private int faq_num;
	private String faq_question;
	private String faq_answer;
	private String faq_category;

	public FaqDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_question() {
		return faq_question;
	}

	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}

	public String getFaq_answer() {
		return faq_answer;
	}

	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

}
