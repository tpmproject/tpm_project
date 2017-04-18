package tpm.comment.model;

import java.util.ArrayList;

public interface CommentDAO {
	
	public ArrayList<CommentDTO> getCommentList(CommentDTO dto);
	public int addComment(CommentDTO dto);
	public int updateComment(CommentDTO dto);
	public int delComment(CommentDTO dto);

}
