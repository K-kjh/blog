package blog.root.controll;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import blog.root.mapper.CommentMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentController {

	@Inject
	private CommentMapper commentmapper;
	
	@PostMapping("/board/{board_number}/comment")
	@ResponseBody
	public int commentInput(@PathVariable int board_number,String commentInput , HttpSession session) throws Exception {
		
		if(session.getAttribute("root") != null) {
			log.info("로그있음.");

			commentInput = solve(commentInput);
			commentmapper.insertComment(board_number, commentInput, 1);
			
			
		}else {
			log.info("로그없음");

			commentInput = solve(commentInput);
			commentmapper.insertComment(board_number, commentInput, 0);
			
		}
			
		return 1;
	}

	private static String solve(String str) {
		log.info("text len test ------");
		
		int count=0;
		String comment="";
		for(int i=0;i<str.length();i++) {
			
			if(str.charAt(i) == '\n') {
				count=0;
			}
			
			if(count>=95) {
				comment+='\n';
				log.info("-");
				count=0;
			}else {
				comment+=str.charAt(i);
			}
			count++;
		}
		
		log.info(":"+comment);
		return comment;
		
	}
}
