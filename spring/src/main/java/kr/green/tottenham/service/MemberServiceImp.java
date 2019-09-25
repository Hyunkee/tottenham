package kr.green.tottenham.service;

import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.tottenham.dao.MemberDAO;
import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public boolean register(MemberVO mVo) {
		if(mVo == null)
			return false;					
		if(memberDao.getMember(mVo.getId()) != null)
			return false;
		// 회원가입창에서 입력받은 암호를 암호화 시킴
		String encodePw = passwordEncoder.encode(mVo.getPw());
		// 회원 정보의 비밀번호를 암호화된 비밀번호로 변경
		mVo.setPw(encodePw);
		memberDao.register(mVo);
		return true;
	}

	@Override
	public MemberVO signin(MemberVO mVo) {
		if(mVo == null)
			return null; // 예외처리
		MemberVO oVo = memberDao.getMember(mVo.getId()); //dao에게 id와 일치하는 회원 정보를 가져오게 시키고 저장한 후,
		if(oVo == null)			
			return null; // 가져오게 시키고 저장한 후, 저장된 회원 정보가 없으면(null) 컨트롤러에게 회원 아니라고 알려주고
		if(passwordEncoder.matches(mVo.getPw(), oVo.getPw())) 
			//CharSequence: String과 반대로 문자열을 변형, 가공을 할 수 있기때문에 쓰임 		
			return oVo;//있으면 가져온 회원정보 비밀번호와 입력한
						//회원정보 비밀번호를 비교하여 같으면 컨트롤러에게 회원이라고 알려주고, 다르면 아니라고 알려준다.		
		return null;
	}

	@Override
	public boolean isMember(String id) {
		if(memberDao.getMember(id) == null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean modify(MemberVO mVo, String oldPw) {
		if(mVo == null)
			return false;
		MemberVO oVo = memberDao.getMember(mVo.getId()); 
		if(passwordEncoder.matches(oldPw, oVo.getPw())) {
			mVo.setPw(passwordEncoder.encode(mVo.getPw()));
			memberDao.modify(mVo);
			return true;
		}
		return false;
		
	}

	@Override
	public String getVal(String id) {
		String [] arr = id.split("=");
		if(arr.length == 2)			
			return arr[1];
		else
			return "";
	}

	@Override
	public boolean checkMember(String id, String email) {
		MemberVO user = memberDao.getMember(id);
		if(user != null && user.getEmail().equals(email)) {
			return true;
		}
		return false;
	}
	
	@Override
	public MemberVO checkId(String name, String email) {
		MemberVO user = memberDao.getEmail(email);		
		if(user != null && user.getName().equals(name)) {			
			return user;
		}
		return null;
	}

	@Override
	public String createPw() {
		String str = "0123456789abcdefghijklmnoqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&*()";
		String pw = "";
		for(int i=0; i<8; i++) {
			int r = (int)(Math.random()*73);
			pw += str.charAt(r);
		}
		return pw;
	}

	@Override
	public void modify(String id, String email, String newPw) {
		MemberVO user = memberDao.getMember(id);
		if(user == null)	return;
		if(!user.getEmail().equals(email))	return;
		String encodePw = passwordEncoder.encode(newPw);
		user.setPw(encodePw);
		memberDao.modify(user);		
	}

	@Override
	public void sendMail(String email, String title, String contents) {
		String setfrom = "stajun@naver.com";
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(email);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        messageHelper.setText(contents);  // 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }
		
	}

	@Override
	public ArrayList<MemberVO> getAllMember(Criteria cri) {
		return memberDao.getAllMember(cri);
	}

	@Override
	public int getTotalCount() {
		return memberDao.getTotalCount();
	}

	@Override
	public void updateAuthority(MemberVO mVo) {
		memberDao.updateAuthority(mVo);		
	}
}
