package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.FaqDTO;

public class FaqDAOImp implements FaqDAO {
	private SqlSessionTemplate sqlSession;

	public FaqDAOImp() {
	}

	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FaqDTO> list(String faq_category) {
//		System.out.println("faqdaoimp에서 select 결과 사이즈 : "+sqlSession.selectList("faq.list").size());
		return sqlSession.selectList("faq.list", faq_category);
	}

	@Override
	public int count() {
		return sqlSession.selectOne("faq.count");
	}

}
