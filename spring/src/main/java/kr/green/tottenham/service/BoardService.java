package kr.green.tottenham.service;

import java.util.ArrayList;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList(Criteria cri, String valid);

	int getTotalCount(Criteria cri, String valid);

}
