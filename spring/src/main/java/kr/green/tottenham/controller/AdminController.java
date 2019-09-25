package kr.green.tottenham.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.pagination.PageMaker;
import kr.green.tottenham.service.BoardService;
import kr.green.tottenham.service.MemberService;
import kr.green.tottenham.service.PageMakerService;
import kr.green.tottenham.vo.BoardVO;
import kr.green.tottenham.vo.MemberVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	MemberService memberService;
	@Autowired
	PageMakerService pageMakerService;
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/user/list", method = RequestMethod.GET)
	public ModelAndView adminUserListGet(ModelAndView mv, Model model,Criteria cri) {		
		cri.setPerPageNum(5);
		// 리스트를 현재 페이지 정보를 기준으로 가져와야함
		ArrayList<MemberVO> list = memberService.getAllMember(cri);
		//totalCount를 db에서 검색해서 가져와야함.
		int totalCount = memberService.getTotalCount();
		//jsp에서 페이지네이션 링크를 board가 아닌 admin/user/list로 수정해야함
		PageMaker pageMaker = pageMakerService.getPageMaker(5, cri, totalCount);
	    		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker);		
		mv.setViewName("/admin/user/list");
		return mv;
	}
	
	@RequestMapping(value="/user/update", method=RequestMethod.GET)
	public String adminUserUpdateGet(Model model,Criteria cri,MemberVO mVo) {
		memberService.updateAuthority(mVo);
		model.addAttribute("page", cri.getPage());
		return "redirect:/admin/user/list";
	}
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public ModelAndView adminBoardListGet(ModelAndView mv, Model model, Criteria cri) {
		cri.setPerPageNum(10);
		ArrayList<BoardVO> boardList = boardService.getBoardListAll(cri);
		int totalCount = boardService.getTotalCountAll(cri);
		PageMaker pm = pageMakerService.getPageMaker(5, cri, totalCount);
		model.addAttribute("pageMaker", pm);
		model.addAttribute("list", boardList);
		mv.setViewName("/admin/board/list");
		return mv;
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public String adminBoardUpdateGet(Model model,Criteria cri,BoardVO bVo) {
		boardService.updateValid(bVo);
		model.addAttribute("page", cri.getPage());
		return "redirect:/admin/board/list";
	}
}
