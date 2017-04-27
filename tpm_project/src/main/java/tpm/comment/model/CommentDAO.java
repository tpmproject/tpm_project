package tpm.comment.model;

import java.util.ArrayList;

public interface CommentDAO {
	
	public ArrayList<CommentDTO> getCommentList(int work_idx);
	public int addComment(CommentDTO dto);
	public int updateComment(CommentDTO dto);
	public int delComment(CommentDTO dto);
	public ArrayList<CommentDTO> CommentList(int work_idx);

}
