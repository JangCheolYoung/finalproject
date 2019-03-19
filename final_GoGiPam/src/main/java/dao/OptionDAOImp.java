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
	public List<OptionDTO> loadOption(String item_namekey) {
		return sqlSession.selectList("option.loadOption", item_namekey);
	}

}
