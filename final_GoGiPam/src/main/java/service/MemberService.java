package service;

import dto.MemberDTO;

public interface MemberService {
	public void insertProcess(MemberDTO mdto);
	public MemberDTO dupIdChkProcess(String member_id);
	public MemberDTO dupTelChkProcess(String member_tel);
}
