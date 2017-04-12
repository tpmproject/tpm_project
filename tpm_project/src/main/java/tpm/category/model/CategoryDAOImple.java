package tpm.category.model;

import org.mybatis.spring.SqlSessionTemplate;

public class CategoryDAOImple implements CategoryDAO {

	private SqlSessionTemplate sqlMap;
	
	public CategoryDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	
	public int categoryInsert(CategoryDTO dto) {
		int idx=sqlMap.selectOne("categoryIdx");
		dto.setCategory_idx(idx);
		int result=sqlMap.insert("categoryInsert", dto);
		if(result>0){
			return idx;
		}else{
			return 0;
		}
	}

	public int categoryUpdate(CategoryDTO dto) {
		int result=sqlMap.update("categoryUpdate", dto);
		if(result>0){
			return dto.getCategory_idx();
		}else{
			return 0;
		}
	}

	public int categoryDelete(int category_idx) {
		int result=sqlMap.delete("categoryDelete", category_idx);
		if(result>0){
			return category_idx;
		}else{
			return 0;
		}
	}

}
