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
	
	@GetMapping("/board/{board_number}/update") 
	public String board_update(@PathVariable int board_number,Model model) throws Exception {
		
		List<SubjectVO> subList = subjectService.AllSubject();
		BoardDTO boardDTO = boardService.selectBoardList(board_number);
		
		model.addAttribute("subList", subList );
		
		model.addAttribute("update_board_number", board_number);
		model.addAttribute("update_board_title",boardDTO.getBoard_title());
		model.addAttribute("update_board_contents",boardDTO.getBoard_contents());
		

		return "/addboard";
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
		
		int a =boardService.Board_create(board_title, board_type, board_contents);
		return a;
		
	}
	
	@PostMapping(value="/board/{board_number}/delete")
	@ResponseBody
	public int boardDelete(@PathVariable int board_number,HttpSession session) {
		if(session.getAttribute("root") != null) {
			try {
				return boardService.boardDelete(board_number);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return 0;
	}
	
	@PostMapping(value="/board/{board_number}/update")
	@ResponseBody
	public int boardUpdate(@PathVariable int board_number, String board_title,String board_contents,int board_type) {
		String str;
		log.info("title"+board_title);
		log.info("contents"+board_contents);
		
		str=board_contents.replace("<div>", "<br/>");
		str=str.replace("<br>", "");
		str=str.replace("</div>", "");

		
		log.info("contents"+board_contents);
		board_contents=str;
		
		try {
			
			return boardService.
					boardUpdate(board_contents, board_title, board_type, board_number);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return 0;
		
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
	public String board_number(@PathVariable int board_number,Model model) throws Exception {
		
		BoardDTO boardDTO = boardService.selectBoardList(board_number);
		List<CommentDTO> commentDTO = commentService.selectCommentList(board_number);
		
		model.addAttribute("board_number", board_number);
		model.addAttribute("boardDTO",boardDTO);
		model.addAttribute("commentDTO",commentDTO);
		
		return "board";
	}
	
}
