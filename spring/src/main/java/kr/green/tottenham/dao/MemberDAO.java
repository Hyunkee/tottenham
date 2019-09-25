package kr.green.tottenham.dao;

import java.util.ArrayList;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.MemberVO;

public interface MemberDAO {

	MemberVO getMember(String id);

	void register(MemberVO mVo);

	void modify(MemberVO mVo);

	MemberVO getEmail(String email);

	ArrayList<MemberVO> getAllMember(Criteria cri);

	int getTotalCount();

	void updateAuthority(MemberVO mVo);

}
