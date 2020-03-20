package blog.root.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import blog.root.mapper.BoardMapper;
import blog.root.model.BoardDTO;
import blog.root.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardMapper boardMapper;
	
	public BoardDTO selectBoardList(int board_number) throws Exception {
		
		return boardMapper.selectBoardList(board_number);
	}

	public List<BoardVO> mainBoardList(int paging_number) throws Exception {
		
		return boardMapper.mainBoardList(paging_number);
	}

	public int BoardCount(int board_number) throws Exception {
	
		return boardMapper.BoardCount(board_number);
	}

	public int Board_create(String board_title, int board_type, String board_contents) {
		return boardMapper.Board_create(board_title, board_type, board_contents);
	}

	public int paging_max() {
		int pagingmax;
		
		try {
			pagingmax= boardMapper.paging_max();
			return pagingmax;
		}catch(Exception e) {
			return 0;
		}
	}

	@Override
	public List<BoardVO> subtypeBoardList(int subject_type, int paging_number) throws Exception {
		
		return boardMapper.subtypeBoardList(subject_type, paging_number);
	}

	@Override
	public int paging_type_max(int board_type)  throws Exception{
		
		return boardMapper.paging_type_max(board_type);
	}

	
	

}
