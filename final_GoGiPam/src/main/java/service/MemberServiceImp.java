package service;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberServiceImp implements MemberService {
	private MemberDAO mdao;
	
	public MemberServiceImp() {
	
	}
	
	public void setMdao(MemberDAO mdao) {
		this.mdao = mdao;
	}

	@Override
	public void insertProcess(MemberDTO mdto) {
		mdao.insertMember(mdto);
	}

	@Override
	public MemberDTO dupIdChkProcess(String member_id) {
		return mdao.dupIdCheck(member_id);
	}

	@Override
	public MemberDTO dupTelChkProcess(String member_tel) {
		return mdao.dupTelCheck(member_tel);
	}
}
