package blog.root.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDTO {
	private int comment_number;
	private String contents;
	private int writer;
	private Timestamp comment_date;
	
}
