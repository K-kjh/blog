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
			log.info("로그있음");
			
			commentmapper.insertComment(board_number, commentInput, 1);
			
			
		}else {
			log.info("로그없음");

			commentmapper.insertComment(board_number, commentInput, 0);
			
		}
			
		log.info(" :: "+commentInput);
		return 1;
	}
}
