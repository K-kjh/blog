package blog.root.Service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import blog.root.model.BoardDTO;
import blog.root.model.BoardVO;
import blog.root.model.UserDTO;
import blog.root.service.BoardService;
import blog.root.service.CommentService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class BoardBeanTest {
	
	@Autowired
	private BoardService board;
	private CommentService comment;
	
	
	
	@Test
	public void boardList() {
		int page =0;
		log.info("-----------------------");
		log.info("-----------------------");
		log.info("-----------------------");
		log.info("-----------------------");
		log.info("-----------------------");
		log.info("-----------------------");
		log.info("-----------------------");
		log.info("-----------------------");
		try {
			
		List<BoardVO> boardList = board.mainBoardList(0);
		log.info("-");
		for(BoardVO board:boardList) {
			log.info("name : "+board.getNickname());
		}
		}catch(Exception e) {
			log.info("+++++++++++++++====");
		}
		
	}
	
//	@Test
//	public void Board() {
//		int paging_number = 0;
//		int board_number=3;
//		int board_type=12;
//		
//		try {
//			
//			//게시물 ,분류별,전체 페이징 
//			board.mainBoardList(paging_number);
//			board.selectBoardList(board_number);
//			board.subtypeBoardList(board_type, paging_number);
//			
//			//게시물 조회수 
//			board.BoardCount(board_number);
//			
//			
//		} catch (E)xception e) {
//			e.printStackTrace();
//		}
//		
//	}
	
//	@Test
//	public void boardCRUD() {
//		int board_number=5;
//		int user_number=3;
//		String board_title="title";
//		String board_contents="contents";
//		int board_type=11;
//		
//		try {
//			
//			//board.boardUpdate(board_contents, board_title, board_type, board_number, user_number);
//			
//			//게시글을 지울떄는 해당 게시글 댓글전부를 제거후 게시물제거
//			//comment.deleteAllComment(board_number);
//			//board.Board_create(board_title, board_type, board_contents, user_number);
//			
//		}catch(Exception e) {
//			
//		}
//		
//		try {
//			//board.boardDelete(board_number, user_number); return INT
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	
	

}
