package kr.green.tottenham.dao;

import kr.green.tottenham.vo.MemberVO;

public interface MemberDAO {

	MemberVO getMember(String id);

	void register(MemberVO mVo);

}
