package kr.green.tottenham.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tottenham.dao.LeagueDAO;
import kr.green.tottenham.vo.LeagueVO;

@Service
public class LeagueServiceImp implements LeagueService {
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public ArrayList<LeagueVO> getLeagueList() {
		return leagueDao.getLeagueList();
	}

}
