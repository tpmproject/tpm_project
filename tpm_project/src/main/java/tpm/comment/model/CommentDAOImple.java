package tpm.comment.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public class CommentDAOImple implements CommentDAO {

	private SqlSessionTemplate sqlMap;
	
	public CommentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<CommentDTO> getCommentList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int addComment() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateComment() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delComment() {
		// TODO Auto-generated method stub
		return 0;
	}

}
