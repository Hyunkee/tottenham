package kr.green.tottenham.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;

public interface BoardDAO {

	public ArrayList<BoardVO> selectBoardList(@Param("cri")Criteria cri,@Param("valid")String valid);

	public int selectCountBoardList(@Param("cri")Criteria cri,@Param("valid")String valid);

	public void insertBoard(@Param("board")BoardVO bVo);

	public BoardVO selectBoard(@Param("num")Integer num);

	public void updateBoard(@Param("board")BoardVO board);

}
