package tpm.category.model;

import org.mybatis.spring.SqlSessionTemplate;

public class CategoryDAOImple implements CategoryDAO {

	private SqlSessionTemplate sqlMap;
	
	public int categoryInsert(CategoryDTO dto) {
		
		int result=sqlMap.insert("categoryInsert", dto);
		
		return result;
	}

	public int categoryUpdate(CategoryDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int categoryDelete(int category_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

}
