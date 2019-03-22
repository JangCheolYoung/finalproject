package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.AddressDTO;

public class AddressDAOImp implements AddressDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public AddressDAOImp() {
		
	}
	
	public AddressDAOImp(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertAddress(AddressDTO adto) {
		sqlSession.insert("address.insertAddress", adto);
	}

	@Override
	public void updateAddress(AddressDTO adto) {
		sqlSession.update("address.updateAddress", adto);
		
	}

	@Override
	public void deleteAddress(AddressDTO adto) {
		sqlSession.delete("address.deleteAddress", adto);
		
	}

	@Override
	public List<AddressDTO> selectAddress(String member_id) {
		return sqlSession.selectList("address.selectAddress", member_id);
		
	}

	@Override
	public int countAddress(String member_id) {
		return sqlSession.selectOne("address.countAddress", member_id);
	}

}
