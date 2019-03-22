package email;

import java.io.File;
import java.util.ArrayList;

public class JAVA2MailVO {

	public String FROM = "";//보내는 계정
	public String TO = "";//받는 계정
	public String CC = "";//참조
	public String BCC = "";//숨은 참조
	public String TITLE = "";//제목
	public String BODY = "";//내용
	public ArrayList<File> FILELIST = new ArrayList<File>();//참조파일보낼경로
}
