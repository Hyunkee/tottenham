package kr.green.tottenham.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.tottenham.dao.MemberDAO;
import kr.green.tottenham.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

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

}
