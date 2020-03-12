package blog.root.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class BoardVO {
	private int board_number;
	private String board_title;
	private int board_type;
	private String board_contents;
	private Date board_date;
	private int board_count;
}