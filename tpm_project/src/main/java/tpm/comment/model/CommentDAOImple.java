package tpm.comment.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class CommentDAOImple implements CommentDAO {

	private SqlSessionTemplate sqlMap;
	
	public CommentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	/*public ArrayList<CommentDTO> getCommentList(int work_idx) {
		ArrayList<CommentDTO> arr = (ArrayList)sqlMap.selectList("listComment", work_idx);
		return arr;
	}*/
	
	public List<Object> getCommentList(Object obj){
		return sqlMap.selectList("listComment", obj);
	}
	
	/*public ArrayList<CommentDTO> CommentList(int work_idx) {
		ArrayList<CommentDTO> arr = (ArrayList)sqlMap.selectList("commentList", work_idx);
		return arr;
	}*/

	public int addComment(CommentDTO dto) {
		int count = sqlMap.insert("addComment", dto);
		return count;
	}
	
	public int commentAdd(CommentDTO dto){
		return sqlMap.insert("addComment", dto);
	}

	public int updateComment(CommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delComment(CommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
