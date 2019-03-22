package email;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class JAVA2Mail {


	public JAVA2Mail(){

	}

	/**
	 * 복합기 정보 기준으로 메일전송함!
	 * @param vo :메일데이터
	 * @throws Exception
	 */
	public void sendMail(JAVA2MailVO vo)throws Exception{
		Properties props = new Properties();
//		props.put("mail.transport.protocol", "smtp");
//		props.put("mail.smtp.host", MAILSERVER_IP);
//		props.put("mail.smtp.port", MAILSERVER_PORT);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		//create the session and create the new mail message
		System.out.println(vo.BODY);
		Session mailSession = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("wkdcjfdjd@gmail.com", "roqltm50con##");
	
			}
		});

		//Session mailSession = Session.getInstance(props);
		MimeMessage msg = new MimeMessage(mailSession);
		Multipart mp = new MimeMultipart();

		
		System.out.println(vo.FROM);
		msg.setFrom(new InternetAddress(vo.FROM));
	    msg.setRecipients(Message.RecipientType.TO, setMailDestination(vo.TO));
	    if(!vo.CC.trim().equals(""))msg.setRecipients(Message.RecipientType.CC, setMailDestination(vo.CC));
	    if(!vo.BCC.trim().equals(""))msg.setRecipients(Message.RecipientType.BCC, setMailDestination(vo.BCC));
	    msg.setSentDate(new Date());
	    msg.setSubject(MimeUtility.encodeText(vo.TITLE,"EUC-KR","B"));
	    //내용
	    BodyPart body = new MimeBodyPart();
	    body.setContent(vo.BODY, "text/html; charset=EUC-KR");
	    mp.addBodyPart(body);
	    
	    //첨부
	    addFile(mp, vo.FILELIST);

	    msg.setContent(mp);
	    Transport.send(msg);
	}

	private InternetAddress[] setMailDestination(String mailADDR)throws Exception{
		String[] array_mailAddr = mailADDR.split("[;]");
		InternetAddress[] rtn = new InternetAddress[array_mailAddr.length];
		for(int k=0;k<array_mailAddr.length;k++){
			rtn[k] = new InternetAddress(array_mailAddr[k]);
		}
		return rtn;
	}

	/**
	 * 파일첨부
	 * @param mp
	 * @param path
	 * @return
	 * @throws Exception
	 */
	private void addFile(Multipart mp, ArrayList<File> FILELIST)throws Exception{

		for(int k=0;k<FILELIST.size();k++){
			File f = FILELIST.get(k);
			if(f.isDirectory()) continue;
			MimeBodyPart filepart = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(f);
			filepart.setDataHandler(new DataHandler(fds));
			filepart.setFileName(f.getName());
			mp.addBodyPart(filepart);
		}

	}

}
