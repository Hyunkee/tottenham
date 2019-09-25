package kr.green.tottenham.service;

import java.util.ArrayList;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.vo.MemberVO;

public interface MemberService {

	public boolean register(MemberVO mVo);

	public MemberVO signin(MemberVO mVo);

	public boolean isMember(String id);

	public boolean modify(MemberVO mVo, String oldPw);

	public String getVal(String id);

	public boolean checkMember(String id, String email);

	public String createPw();

	public void modify(String id, String email, String newPw);

	public void sendMail(String email, String title, String contents);

	public MemberVO checkId(String name, String email);

	public ArrayList<MemberVO> getAllMember(Criteria cri);

	public int getTotalCount();

	public void updateAuthority(MemberVO mVo);	

}
