package blog.root.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import blog.root.mapper.CommentMapper;
import blog.root.model.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentMapper mapper;
	
	
	@Override
	public List<CommentDTO> selectCommentList(int comment_number) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectCommentList(comment_number);
	}

	@Override
	public int insertComment(int comment_number, String contents, int writer) throws Exception {
		// TODO Auto-generated method stub
		return mapper.insertComment(comment_number, contents, writer);
	}

}
