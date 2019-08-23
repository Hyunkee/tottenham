package kr.green.tottenham.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
}
