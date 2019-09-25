package kr.green.tottenham.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;
import kr.green.tottenham.vo.CommentVO;
import kr.green.tottenham.vo.FileVO;

public interface BoardService {

	public ArrayList<BoardVO> getBoardList(Criteria cri, String valid);

	public int getTotalCount(Criteria cri, String valid);

	public int registerBoard(BoardVO bVo);

	public BoardVO getBoard(Integer num);

	public BoardVO increaseViews(BoardVO board);

	public boolean isWriter(Integer num, HttpServletRequest r);

	public void modifyBoard(BoardVO bVo);

	public void addFile(String file, int num);

	public ArrayList<FileVO> getFiles(Integer num);

	public void deleteBoard(Integer num);

	public CommentVO registerComment(CommentVO cVo);

	public ArrayList<CommentVO> getCommentList(Integer num);

	public boolean deleteComment(CommentVO cVo);

	public BoardVO increaseComment(CommentVO cVo,BoardVO bVo);

	public CommentVO getCommentCount(CommentVO cVo);

	public ArrayList<BoardVO> getBoardListAll(Criteria cri);

	public int getTotalCountAll(Criteria cri);

	public void updateValid(BoardVO bVo);

	
	

	

	

	

	

	

	

		
}
