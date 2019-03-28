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
	
	@Override
	public int loginProcess(MemberDTO mdto) {
		return mdao.loginChk(mdto);
	}

	@Override
	public String findIdPro(MemberDTO mdto) {
		return mdao.findId(mdto);
	}

	@Override
	public int findPwPro(MemberDTO mdto) {
		return mdao.findPw(mdto);
	}
	
	@Override
	public void updatePwdPro(MemberDTO mdto) {
		//System.out.println("updqtePwdPro 메소드.");
		mdao.updatePwd(mdto);
	}

	@Override
	public MemberDTO infoUserProcess(String member_id) {
		return mdao.infoUser(member_id);
	}
}
