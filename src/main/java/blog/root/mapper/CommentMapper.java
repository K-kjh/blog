package blog.root.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import blog.root.model.CommentDTO;

public interface CommentMapper {
	
	@Select("select * from comment where comment_number =#{comment_number}")
	public List<CommentDTO> selectCommentList(@Param("comment_number")int comment_number) throws Exception;

	@Insert("insert into comment(comment_number,contents,writer) values(#{comment_number},#{contents},#{writer})")
	public int insertComment(@Param("comment_number")int comment_number,@Param("contents")String contents,@Param("writer")int writer) throws Exception;


}
