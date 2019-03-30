package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.OptionDTO;

public class OptionDAOImp implements OptionDAO {
	
private SqlSessionTemplate sqlSession;
	
	public OptionDAOImp() { }
	
	public OptionDAOImp(SqlSessionTemplate sqlSession) {
	    this.sqlSession = sqlSession;
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
	    this.sqlSession = sqlSession;
	}
	
	@Override
	public List<OptionDTO> loadFullOption(String item_key) {
		return sqlSession.selectList("option.loadFullOption", item_key);
	}

	@Override
	public String loadOptionKey(OptionDTO odto) {
		return sqlSession.selectOne("option.loadOptionKey", odto);
	}

	@Override
	public String loadOption(String option_key) {
		return sqlSession.selectOne("option.loadOption", option_key);
	}

}
