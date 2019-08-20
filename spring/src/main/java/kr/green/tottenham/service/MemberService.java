package kr.green.tottenham.service;

import kr.green.tottenham.vo.MemberVO;

public interface MemberService {

	public boolean register(MemberVO mVo);

	public MemberVO signin(MemberVO mVo);	

}
