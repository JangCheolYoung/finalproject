package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemberDTO;

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

}
