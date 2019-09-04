package kr.green.tottenham.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.tottenham.dao.BoardDAO;
import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;
import kr.green.tottenham.vo.FileVO;
import kr.green.tottenham.vo.MemberVO;

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
	public int registerBoard(BoardVO bVo) {
		boardDao.registerBoard(bVo);
		return boardDao.getMaxBoardNum();
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

	@Override
	public boolean isWriter(Integer num, HttpServletRequest r) {
		BoardVO board = boardDao.selectBoard(num);
		MemberVO user = (MemberVO)(r.getSession().getAttribute("user"));
		if(board != null && board.getWriter().equals(user.getId())) {
			return true;
		}
		return false;
	}

	@Override
	public void modifyBoard(BoardVO bVo) {
		BoardVO tmp = boardDao.selectBoard(bVo.getNum());
		bVo.setValid(tmp.getValid());
		bVo.setViews(tmp.getViews());
		boardDao.updateBoard(bVo);		
	}
	
	@Override
	public void deleteBoard(Integer num) {
		BoardVO board = boardDao.selectBoard(num);
		if(board == null)
			return;
		board.setValid("D");
		boardDao.updateBoard(board);
		
	}	

	@Override
	public void addFile(String file, int num) {
		boardDao.insertFile(file,num);		
	}

	@Override
	public ArrayList<FileVO> getFiles(Integer num) {
		return boardDao.selectFileList(num);
	}

	
}
