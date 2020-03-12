package blog.root.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int board_number;
	private String board_title;
	private int board_type;
	private String board_contents;
	private Date board_date;
	private int board_count;

}