package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemberDTO;
import dto.OrderDTO;

public class MemberDAOImp implements MemberDAO {
	private SqlSessionTemplate sqlSession;
	
	public MemberDAOImp() { }
	
	public MemberDAOImp(SqlSessionTemplate sqlSession) {
	    this.sqlSession = sqlSession;
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
	    this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertMember(MemberDTO mdto) {
		sqlSession.insert("member.insertMember", mdto);
	}

	@Override
	public MemberDTO dupIdCheck(String member_id) {
		return sqlSession.selectOne("member.dupIdCheck", member_id);
		
	}

	@Override
	public MemberDTO dupTelCheck(String member_tel) {
		return sqlSession.selectOne("member.dupTelCheck", member_tel);
	}
	
	@Override
	public int loginChk(MemberDTO mdto) {
		return sqlSession.selectOne("member.login", mdto);
	}
	
	@Override
	public String findId(MemberDTO mdto) {
		return sqlSession.selectOne("member.findid", mdto);
	}

	@Override
	public int findPw(MemberDTO mdto) {
		return sqlSession.selectOne("member.findpw", mdto);
	}
	
	@Override
	public void updatePwd(MemberDTO mdto) {
		//System.out.println("updatePwd메소드.");
		sqlSession.update("member.updatepw", mdto);
	}

	@Override
	public MemberDTO infoUser(String member_id) {
		return sqlSession.selectOne("member.infoUser", member_id);
	}

	@Override
	public void update_useMileage(OrderDTO orderDto) {
		sqlSession.update("member.update_UseMileage", orderDto);
		
	}

	@Override
	public void update_plusMileage(OrderDTO orderDto) {
		sqlSession.update("member.update_PlusMileage", orderDto);
		
	}

}
