package kr.green.tottenham.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tottenham.utils.UploadFileUtils;
import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.pagination.PageMaker;
import kr.green.tottenham.service.BoardService;
import kr.green.tottenham.service.PageMakerService;
import kr.green.tottenham.vo.BoardVO;


@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	PageMakerService pageMakerService;
	@Resource
	private String uploadPath;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv, Criteria cri) throws Exception{				
		String valid = "I";
		int displayPageNum = 1;
		ArrayList<BoardVO> list = boardService.getBoardList(cri,valid);
		int totalCount = boardService.getTotalCount(cri,valid);		
		PageMaker pm = pageMakerService.getPageMaker(displayPageNum, cri, totalCount);		
	    mv.setViewName("/board/list");
	    mv.addObject("list", list);
	    mv.addObject("pageMaker", pm);	
	    return mv;
	}
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv){
		mv.setViewName("/board/register");
	    return mv;
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String boardRegisterPost(BoardVO bVo, MultipartFile file2) throws IOException, Exception{
		if(file2.getOriginalFilename().length() != 0) {
			String file = UploadFileUtils.uploadFile(uploadPath, file2.getOriginalFilename(),file2.getBytes());
			bVo.setFile(file);
		}		
		boardService.registerBoard(bVo);
	    return "redirect:/board/list";
	}
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ModelAndView boardDisplayGet(ModelAndView mv,Integer num,Criteria cri){
		BoardVO board = boardService.getBoard(num);		
		board = boardService.increaseViews(board);
		mv.setViewName("/board/display");
		mv.addObject("board", board);
		mv.addObject("cri", cri);
	    return mv;
	}
}
