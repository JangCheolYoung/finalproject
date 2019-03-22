package email;

import java.util.HashMap;

public class SendEmail {
	// 사용 안하는 코드. 이메일 전송 안함
	public static void sendMail(String email, String resetPassworeLink)throws Exception{
		HashMap<String, Object> arg = new HashMap<String, Object>();
		StringBuffer mailHtml = new StringBuffer();// StringBuffer객체 mailHtml생성
		mailHtml.append("<html>");
		mailHtml.append("<body\">");
		mailHtml.append("<div style=\"width:100%;background:#f3f3f3;padding-top:10%;padding-bottom:10%; \">");
		mailHtml.append("<div  style=\"width:70%; margin-left:5%;padding:10%;border: 1px solid #ccc;background:#fff; \">");
		mailHtml.append("<span style=\"font-weight:bold;font-size: 1.2em\">[고기팜] 비밀번호 찾기 요청</span><br><hr style=\"border-width: 2px;\">");
		mailHtml.append("<div  style=\"margin-top:5%;\">");
		mailHtml.append("<span style=\"font-size: 1.1em;color: #222\">안녕하세요." + email +" 님. 고기팜입니다.</span>.<br>");
		mailHtml.append("<span style=\"font-size: 1.1em;color: #222\">회원님의 새로운 비밀번호 설정을 위한 링크를 보내드렸습니다.</span>.<br>");
		mailHtml.append("<span style=\"font-size: 1.1em;color: #222\">아래 링크로 이동하여 새로운 비밀번호를 설정해 주시기 바랍니다.</span>.<br>");
		//mailHtml.append("<span style=\"color:#ff9d41;margin-top:15px;\">인증번호가 도착했습니다.");
		mailHtml.append("</div>");
		mailHtml.append("<div style=\"margin-top:30px;border-bottom: 1px solid #bbb;border-top: 1px solid #bbb;padding:5%;background: #eee\" >");
		mailHtml.append("<div><span style=\"font-weight: bold;color : #3d8aea;\"><a href="+resetPassworeLink+" target=\"_blank\">" +resetPassworeLink +"</a></span></div>");
		mailHtml.append("</div>");
		//mailHtml.append("<div style=\"margin-top:30px;\"><span style=\"font-size: 1em;color:black\">자세한 사항은 시나브로에서 참고하시기 바랍니다.<br>감사합니다.</span><br></div>");
		mailHtml.append("</div>");
		mailHtml.append("</div>");
		mailHtml.append("</body>");
		mailHtml.append("</html>");
		mailHtml.append("</html> \n");

		JAVA2MailVO mailvo = new JAVA2MailVO();
		mailvo.FROM = "manage@gogipam.com"; //발신자
		mailvo.TO = email; //수신자
		mailvo.TITLE = "[고기팜]" + email + "님의 새 비밀번호 설정 링크입니다."; //메일제목
		mailvo.BODY = mailHtml.toString(); //내용

		JAVA2Mail mail = new JAVA2Mail();
		mail.sendMail(mailvo);
	}
}
