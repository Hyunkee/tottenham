package kr.green.tottenham.service;

import java.util.ArrayList;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;

public interface BoardService {

	public ArrayList<BoardVO> getBoardList(Criteria cri, String valid);

	public int getTotalCount(Criteria cri, String valid);

	public void registerBoard(BoardVO bVo);

	public BoardVO getBoard(Integer num);

	public BoardVO increaseViews(BoardVO board);

}
