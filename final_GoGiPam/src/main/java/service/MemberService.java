package service;

import dto.MemberDTO;
import dto.OrderDTO;

public interface MemberService {
	public void insertProcess(MemberDTO mdto);
	public MemberDTO dupIdChkProcess(String member_id);
	public MemberDTO dupTelChkProcess(String member_tel);
	public int loginProcess(MemberDTO dto);
	public String findIdPro(MemberDTO dto);
	public int findPwPro(MemberDTO dto);	
	public void updatePwdPro(MemberDTO dto);
	public MemberDTO infoUserProcess(String member_id);
	public void update_useMileageProcess(OrderDTO orderDto);
	public void update_plusMileageProcess(OrderDTO orderDto);
}
