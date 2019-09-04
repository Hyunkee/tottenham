package kr.green.tottenham.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
		if(memberService.modify(mVo,oldPw))
			return "redirect:/";
		else {
			return "redirect:/member/modify";
		}
	}
	@RequestMapping(value="/member/find", method=RequestMethod.GET)
	public ModelAndView memberPasswordGet(ModelAndView mv) throws Exception{
	    mv.setViewName("/member/find");	    
	    return mv;
	}
	@RequestMapping(value ="/checkid")
	@ResponseBody
	public Map<Object, Object> idfind(@RequestBody String str){		
	    Map<Object, Object> map = new HashMap<Object, Object>();	    
	    String [] arr = str.split("&");
	    String name = arr[0];
	    String email = "";	    
	    try {
			email = URLDecoder.decode(arr[1], "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	    	    
	    name = memberService.getVal(name);
	    email = memberService.getVal(email);	  
	    System.out.println(name);
	    System.out.println(email);
	    MemberVO isOk = memberService.checkId(name,email);	    
	    map.put("isOk", isOk.getId());	    
	    return map;
	}
	@RequestMapping(value = "/id/send")
	public String idSend() {
		return "redirect:/member/signin";
	}  
	// 아이디와 이메일체크 
	@RequestMapping(value ="/checkpw")
	@ResponseBody
	public Map<Object, Object> pwfind(@RequestBody String str){

	    Map<Object, Object> map = new HashMap<Object, Object>();
	    // 변수 id에 저장된 아이디가 회원 아이디인지 아닌지 확인하여 isMember변수에 담아 보낸다.
	    System.out.println(str);
	    String [] arr = str.split("&");
	    String id = arr[0];
	    String email = "";	    
	    try {
			email = URLDecoder.decode(arr[1], "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	    	    
	    System.out.println(id);
	    System.out.println(email);
	    id = memberService.getVal(id);
	    email = memberService.getVal(email);	   
	    boolean isOk = memberService.checkMember(id,email);
	    map.put("isOk", isOk);
	    System.out.println(str);
	    return map;
	}
	// 임시 비밀번호 메일로 발송
	@RequestMapping(value = "/password/send")
	public String passwordSend(String email,String id) {
		//비밀번호 생성
		String newPw = memberService.createPw();
		//생성된 비밀번호 DB에 저장
		memberService.modify(id, email, newPw);
		//이메일 발송
		String title = "변경된 비밀번호입니다.";
		String contents = "변경된 비밀번호입니다.\n"+newPw+"\n";
		memberService.sendMail(email,title,contents);
	    return "redirect:/member/signin";
	}  
}
