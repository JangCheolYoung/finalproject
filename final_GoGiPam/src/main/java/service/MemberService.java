package service;

import dto.MemberDTO;

public interface MemberService {
	public void insertProcess(MemberDTO mdto);
	public MemberDTO dupIdChkProcess(String member_id);
	public MemberDTO dupTelChkProcess(String member_tel);
	public int loginProcess(MemberDTO dto);
	public String findIdPro(MemberDTO dto);
	public int findPwPro(MemberDTO dto);	
	public void updatePwdPro(MemberDTO dto);
}
