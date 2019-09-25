package kr.green.tottenham.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.BoardVO;
import kr.green.tottenham.vo.CommentVO;
import kr.green.tottenham.vo.FileVO;

public interface BoardDAO {

	public ArrayList<BoardVO> selectBoardList(@Param("cri")Criteria cri,@Param("valid")String valid);

	public int selectCountBoardList(@Param("cri")Criteria cri,@Param("valid")String valid);	

	public BoardVO selectBoard(@Param("num")Integer num);

	public void updateBoard(@Param("board")BoardVO board);

	public void registerBoard(@Param("board")BoardVO bVo);

	public int getMaxBoardNum();

	public void insertFile(@Param("file")String file, @Param("num")int num);

	public ArrayList<FileVO> selectFileList(Integer num);

	public void updateFile(@Param("board_num")Integer num);

	public void insertComment(@Param("comment")CommentVO cVo);

	public int selectMaxComment();

	public CommentVO selectComment(@Param("num")int no);

	public ArrayList<CommentVO> selectCommentList(@Param("num")Integer num);

	public void updateComment(@Param("cVo")CommentVO cVo1);

	public CommentVO selectCountComment(CommentVO cVo);

	public ArrayList<BoardVO> getBoardListAll(Criteria cri);

	public int getTotalCountAll(Criteria cri);

	public void updateValid(BoardVO bVo);
	
	
	
	
}
