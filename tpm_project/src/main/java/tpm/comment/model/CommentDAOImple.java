package tpm.comment.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public class CommentDAOImple implements CommentDAO {

	private SqlSessionTemplate sqlMap;
	
	public CommentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<CommentDTO> getCommentList(CommentDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	public int addComment(CommentDTO dto) {
		int count = sqlMap.update("addComment", dto);
		return count;
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
