package dao;

import dto.MemberDTO;
import dto.OrderDTO;

public interface MemberDAO {
	public MemberDTO infoUser(String member_id);
	public void insertMember(MemberDTO mdto);
	public MemberDTO dupIdCheck(String member_id);
	public MemberDTO dupTelCheck(String member_tel);
	public int loginChk(MemberDTO mdto);
	public String findId(MemberDTO mdto);
	public int findPw(MemberDTO mdto);
	public void updatePwd(MemberDTO mdto);
	public void update_useMileage(OrderDTO orderDto);
	public void update_plusMileage(OrderDTO orderDto);
}
