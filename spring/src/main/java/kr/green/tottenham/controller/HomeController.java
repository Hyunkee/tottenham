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
	public ModelAndView memberSigninGet(ModelAndView mv) throws Exception{		
	    mv.setViewName("/member/signin");	    
	    return mv;
	}
	@RequestMapping(value="/member/signin", method=RequestMethod.POST)
	public String memberSigninPost(MemberVO mVo, Model model){
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
	public String memberSignoutGet(HttpServletRequest r) throws Exception{
		r.getSession().removeAttribute("user");
	    return "redirect:/";
	}
	@RequestMapping(value="/member/register", method=RequestMethod.GET)
	public ModelAndView memberRegisterGet(ModelAndView mv) throws Exception{
	    mv.setViewName("/member/register");	    
	    return mv;
	}
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	public String memberRegisterPost(MemberVO mVo){
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
	    boolean isMember = memberService.isMember(id);
	    map.put("isMember",isMember);
	    return map;
	}
	@RequestMapping(value="/member/modify", method=RequestMethod.GET)
	public ModelAndView memberModifyGet(ModelAndView mv) throws Exception{
	    mv.setViewName("/member/modify");	    
	    return mv;
	}
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String memberModifyPost(MemberVO mVo, String oldPw) {
		System.out.println(mVo);
		System.out.println(oldPw);
		if(memberService.modify(mVo,oldPw))
			return "redirect:/";
		else {
			return "redirect:/member/modify";
		}
	}
}
