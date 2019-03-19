package dao;

import dto.MemberDTO;

public interface MemberDAO {
	public void insertMember(MemberDTO mdto);
	public MemberDTO dupIdCheck(String member_id);
	public MemberDTO dupTelCheck(String member_tel);
}
