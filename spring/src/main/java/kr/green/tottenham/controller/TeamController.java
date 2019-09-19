package kr.green.tottenham.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tottenham.service.PlayersService;
import kr.green.tottenham.vo.PlayersVO;
import kr.green.tottenham.vo.StatsVO;

@Controller
@RequestMapping(value="/team")
public class TeamController {
	
	@Autowired
	PlayersService playersService;
	
	@RequestMapping(value="/player", method=RequestMethod.GET)
	public ModelAndView teamPlayerGet(ModelAndView mv,Model model,PlayersVO pVo){		
		ArrayList <PlayersVO> list = playersService.getPlayerPositionList(pVo.getPosition());	
		String position = pVo.getPosition();		
		mv.setViewName("/team/player");
		model.addAttribute("pos", position);
		model.addAttribute("list", list);
	    return mv;
	}
	@RequestMapping(value="/stats", method=RequestMethod.GET)
	public ModelAndView teamPlayerStatsGet(ModelAndView mv,Model model,Integer num){
		PlayersVO player = playersService.getPlayer(num);
		ArrayList <StatsVO> sVo = playersService.getPlayerStats(num);
		System.out.println(sVo);
		model.addAttribute("stats", sVo);
		model.addAttribute("player", player);
		mv.setViewName("/team/stats");
	    return mv;
	}
}
