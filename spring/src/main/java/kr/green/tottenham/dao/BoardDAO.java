package kr.green.tottenham.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList(@Param("cri")Criteria cri,@Param("valid")String valid);

	int selectCountBoardList(@Param("cri")Criteria cri,@Param("valid")String valid);

}
