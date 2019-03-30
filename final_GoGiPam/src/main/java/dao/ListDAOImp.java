package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ItemDTO;

public class ListDAOImp implements ListDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public ListDAOImp() {}
	
	public ListDAOImp(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ItemDTO listContent(String item_key) {
		return sqlSession.selectOne("list.contents", item_key);
	}

	@Override
	public List<ItemDTO> listGroup(String item_category) {
		return sqlSession.selectList("list.list_group", item_category);
	}

	@Override
	public List<ItemDTO> listAll() {
		return sqlSession.selectList("list.list_all");
	}

}
