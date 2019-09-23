package kr.green.tottenham.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.tottenham.vo.LeagueVO;

public interface LeagueDAO {

	ArrayList<LeagueVO> getLeagueList();

}
