package tpm.category.model;

public interface CategoryDAO {

	public int categoryInsert(CategoryDTO dto);
	public int categoryUpdate(CategoryDTO dto);
	public int categoryDelete(int category_idx);
}
