package blog.root.service;

import java.util.List;

import blog.root.model.CommentDTO;


public interface CommentService {
	public List<CommentDTO> selectCommentList(int comment_number) throws Exception;
	public int insertComment(int comment_number,String contents,int writer) throws Exception;
	public String solve(String str);
	public void deleteAllComment(int comment_number)throws Exception;
}
