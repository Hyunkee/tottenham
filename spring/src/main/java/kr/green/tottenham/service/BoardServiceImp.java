package kr.green.tottenham.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.tottenham.dao.BoardDAO;
import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;
import kr.green.tottenham.vo.CommentVO;
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
		boardDao.updateFile(num);
	}	

	@Override
	public void addFile(String file, int num) {
		boardDao.insertFile(file,num);		
	}

	@Override
	public ArrayList<FileVO> getFiles(Integer num) {
		return boardDao.selectFileList(num);
	}

	@Override
	public CommentVO registerComment(CommentVO cVo) {
		if(cVo.getBoard_num() == null || cVo.getWriter() == "" || cVo.getContents() == "") {
			return null;
		}
		boardDao.insertComment(cVo);
		int no = boardDao.selectMaxComment();
		System.out.println("selectMaxComment no : " + no);
		return boardDao.selectComment(no);
	}

	@Override
	public ArrayList<CommentVO> getCommentList(Integer num) {
		
		return boardDao.selectCommentList(num);
	}

	@Override
	public boolean deleteComment(CommentVO cVo) {
		if(cVo == null) {
			return false;
		}
		CommentVO cVo1 = boardDao.selectComment(cVo.getNum());
		if(cVo1 == null || !cVo1.getWriter().equals(cVo.getWriter())) {
			return false;
		}
		cVo1.setState("D");
		boardDao.updateComment(cVo1);
		return true;
	}

	@Override
	public BoardVO increaseComment(CommentVO cVo, BoardVO bVo) {		
		int comment_count = bVo.getComment_count();
		bVo.setComment_count(comment_count+1);
		boardDao.updateBoard(bVo);
		return bVo;
		
	}

	@Override
	public CommentVO getCommentCount(CommentVO cVo) {
		return boardDao.selectCountComment(cVo);
	}

	@Override
	public ArrayList<BoardVO> getBoardListAll(Criteria cri) {
		return boardDao.getBoardListAll(cri);
	}

	@Override
	public int getTotalCountAll(Criteria cri) {
		return boardDao.getTotalCountAll(cri);
	}

	@Override
	public void updateValid(BoardVO bVo) {
		boardDao.updateValid(bVo);
	}	
}
