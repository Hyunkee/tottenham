package kr.green.tottenham.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tottenham.dao.BoardDAO;
import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri, String valid) {
		return boardDao.selectBoardList(cri,valid);
	}

	@Override
	public int getTotalCount(Criteria cri, String valid) {
		return boardDao.selectCountBoardList(cri, valid);
	}

	@Override
	public void registerBoard(BoardVO bVo) {
		boardDao.insertBoard(bVo);		
	}

	@Override
	public BoardVO getBoard(Integer num) {
		return boardDao.selectBoard(num);
	}

	@Override
	public BoardVO increaseViews(BoardVO board) {
		int views = board.getViews();
		board.setViews(views+1);
		boardDao.updateBoard(board);
		return board;
	}

}
