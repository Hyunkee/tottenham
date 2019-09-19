package kr.green.tottenham.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.pagination.PageMaker;
import kr.green.tottenham.service.BoardService;
import kr.green.tottenham.service.MemberService;
import kr.green.tottenham.service.PageMakerService;
import kr.green.tottenham.utils.UploadFileUtils;
import kr.green.tottenham.vo.BoardVO;
import kr.green.tottenham.vo.CommentVO;
import kr.green.tottenham.vo.FileVO;


@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	PageMakerService pageMakerService;
	@Resource
	private String uploadPath;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv, Model model, Criteria cri,CommentVO cVo,BoardVO board) throws Exception{				
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
	public String boardRegisterPost(BoardVO bVo, MultipartFile[] file2) throws IOException, Exception{
		int num = boardService.registerBoard(bVo);
		for(MultipartFile tmp : file2)
			if(tmp.getOriginalFilename().length() != 0) {
				String file = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
				boardService.addFile(file,num);				
			}
	    return "redirect:/board/list";
	}
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ModelAndView boardDisplayGet(ModelAndView mv,Integer num,Criteria cri,Model model){
		BoardVO board = boardService.getBoard(num);		
		board = boardService.increaseViews(board);
		ArrayList<FileVO> files = boardService.getFiles(num);
		ArrayList <CommentVO> cVo1 = boardService.getCommentList(num);		
    	model.addAttribute("commentList", cVo1);
		mv.setViewName("/board/display");
		mv.addObject("board", board);
		mv.addObject("cri", cri);		
		model.addAttribute("files", files);
	    return mv;
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv,Integer num,Criteria cri,HttpServletRequest r,Model model){
		boolean isWriter = boardService.isWriter(num, r);
		ArrayList<FileVO> files = boardService.getFiles(num);
		BoardVO board;
		if(isWriter) {
			board = boardService.getBoard(num);
			mv.setViewName("/board/modify");
		}else {
			board = null;
			mv.setViewName("redirect:/board/list");
		}		
		mv.addObject("board", board);
		mv.addObject("cri", cri);
		model.addAttribute("files", files);
	    return mv;
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String boardModifyPost(BoardVO bVo,HttpServletRequest r,MultipartFile[] file2,MultipartFile[] fileOri) throws IOException, Exception{		
		boardService.modifyBoard(bVo);
		if(boardService.isWriter(bVo.getNum(), r))			
			for(MultipartFile tmp : file2)
				if(tmp.getOriginalFilename().length() != 0) {
					System.out.println("boardModifyPost tmp : " + tmp);
					String file = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
					System.out.println("boardModifyPost file : " + file);
					boardService.addFile(file,bVo.getNum());				
				}
	    return "redirect:/board/list";
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv,Integer num,HttpServletRequest r){
		if(boardService.isWriter(num, r))
			boardService.deleteBoard(num);
		mv.setViewName("redirect:/board/list");
	    return mv;
	}
	@ResponseBody
	@RequestMapping("/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);

	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}	
	@RequestMapping(value="/addComment")	//댓글 등록
    @ResponseBody
    public Map<Object, Object> addComment(CommentVO cVo,BoardVO bVo) {		
		BoardVO board = boardService.increaseComment(cVo,bVo);		
    	Map<Object, Object> map = new HashMap<Object, Object>();    	
    	CommentVO cVo1 = boardService.registerComment(cVo);
    	map.put("cVo", cVo1);
    	map.put("commentList", cVo1);
    	return map;
    }
	@RequestMapping(value="/deleteComment")	//댓글 삭제
    @ResponseBody
    public boolean deleteComment(CommentVO cVo) {
    	Map<Object, Object> map = new HashMap<Object, Object>();    	
    	if(boardService.deleteComment(cVo)) {
    		return true;
    	}
    	return false;

    }
}
