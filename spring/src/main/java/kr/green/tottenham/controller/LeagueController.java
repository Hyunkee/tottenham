package kr.green.tottenham.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tottenham.service.LeagueService;
import kr.green.tottenham.vo.LeagueVO;



@Controller
@RequestMapping(value="/league")
public class LeagueController {
	@Autowired
	LeagueService leagueService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView LeagueListGet(ModelAndView mv,Model model,Integer num){
		ArrayList <LeagueVO> list = leagueService.getLeagueList();		
		model.addAttribute("list", list);
		mv.setViewName("/league/list");
	    return mv;
	}
}
