package blog.root.controll;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import blog.root.model.BoardDTO;
import blog.root.model.CommentDTO;
import blog.root.model.SubjectVO;
import blog.root.service.BoardService;
import blog.root.service.CommentService;
import blog.root.service.SubjectService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {


	@Inject
	private SubjectService subjectService;
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private CommentService commentService;
	
	
	
	@GetMapping("/board")
	public void board(Model model) {
		
	}
	
	@PostMapping("/board/page/{page}")
	@ResponseBody
	public void boardpage() {
		
	}
	
	
	@GetMapping("/board/addboard")
	public String board_create(Model model) throws Exception {

		List<SubjectVO> subList = subjectService.AllSubject();

		model.addAttribute("subList", subList );
		
		return "/addboard";
	}
	
	@PostMapping(value="/board/addboard/create")
	@ResponseBody
	public int boardCreate(String board_title,String board_contents,int board_type) {
		log.info(" title : "+board_title+"\ncontents : "+board_contents+" , \nboard_type"+board_type);
		String str;
		
		str=board_contents.replace("<div>", "<br/>");
		str=str.replace("<br>", "");
		str=str.replace("</div>", "");
		
		board_contents=str;
		int a =boardService.Board_create(board_title, board_type, board_contents);
		return a;
		
	}
	
	
	
	@PostMapping(value="/board/count")
	@ResponseBody
	public void boardCount(int board_count,HttpServletRequest req,Model model) {
		try {
			
			if(board_count != 0 ) {
				log.info("board_count : "+ board_count);
			}else {
				throw new Exception();
			}
			int	 board_number =board_count;
		
			if(boardService.BoardCount(board_number) == 1) {
				log.info("조회수 올리기 성공");
			}else {
				log.info("조회수 올리기 실패");
			}
		}catch(Exception e) {
			log.info("조회수 컨트롤 오류");
		}
		
	}
	
	@GetMapping("/board/{board_number}")
	public String board_number(@PathVariable int board_number,Model model , HttpServletResponse res,HttpServletRequest req ) throws Exception {
		
		BoardDTO boardDTO = boardService.selectBoardList(board_number);
		List<CommentDTO> commentDTO = commentService.selectCommentList(board_number);
		
		model.addAttribute("boardDTO",boardDTO);
		model.addAttribute("commentDTO",commentDTO);
		
		return "board";
	}
	
}
