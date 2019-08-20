package kr.green.tottenham.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tottenham.service.MemberService;
import kr.green.tottenham.vo.MemberVO;


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
	public String signinPost(MemberVO mVo, Model model){
		logger.info("로그인 진행중");
		System.out.println(mVo);
		MemberVO user = memberService.signin(mVo);
		if(user != null) {
			model.addAttribute("user",user);
			return "redirect:/";
		}
		return "redirect:/member/signin";	    
	}
	@RequestMapping(value="/member/signout", method=RequestMethod.GET)
	public String signoutGet(HttpServletRequest r) throws Exception{
		r.getSession().removeAttribute("user");
	    return "redirect:/";
	}
	@RequestMapping(value="/member/register", method=RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv) throws Exception{
		logger.info("회원가입 진행중");
	    mv.setViewName("/member/register");	    
	    return mv;
	}
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	public String registerPost(MemberVO mVo){
		logger.info("회원가입 완료");
		System.out.println(mVo);
		if(memberService.register(mVo))
			return "redirect:/";
		else {
			return "redirect:/member/register";
		}		
	}
	@RequestMapping(value ="/member/dup")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){

	    Map<Object, Object> map = new HashMap<Object, Object>();
	    // 변수 id에 저장된 아이디가 회원 아이디인지 아닌지 확인하여 isMember변수에 담아 보낸다.
	    boolean isMember = memberService.isMember(id);
	    map.put("isMember",isMember);	    
	    
	    return map;
	}
}
