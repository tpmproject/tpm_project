package tpm.comment.model;

import java.util.ArrayList;

public interface CommentDAO {
	
	public ArrayList<CommentDTO> getCommentList();
	public int addComment();
	public int updateComment();
	public int delComment();

}
