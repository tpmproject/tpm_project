package tpm.comment.model;

import java.util.*;

public interface CommentDAO {
	
	/*public ArrayList<CommentDTO> getCommentList(int work_idx);*/
	/*public int addComment(CommentDTO dto);*/
	public int updateComment(CommentDTO dto);
	public int delComment(CommentDTO dto);
	/*public ArrayList<CommentDTO> CommentList(int work_idx);*/
	public List<Object> getCommentList(Object obj);
	/*public int commentAdd(CommentDTO dto);*/
	public int addComment(Object obj);
	public Object getCommentContent(Object obj);
	

}
