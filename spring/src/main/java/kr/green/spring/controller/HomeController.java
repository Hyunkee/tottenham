package kr.green.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.MemberService;
import kr.green.spring.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView mainGet(ModelAndView mv) throws Exception{		
	    mv.setViewName("/main/home");	    
	    return mv;
	}
	@RequestMapping(value="/member/signin", method=RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv) throws Exception{		
	    mv.setViewName("/member/signin");	    
	    return mv;
	}
	@RequestMapping(value="/member/signin", method=RequestMethod.POST)
	public String signinPost(ModelAndView mv) throws Exception{	    	    
	    return "redirect:/";
	}
	@RequestMapping(value="/member/register", method=RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv) throws Exception{		
	    mv.setViewName("/member/register");	    
	    return mv;
	}
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	public String registerPost(MemberVO mVo){
		
		return "redirect:/";	    
	}
}
