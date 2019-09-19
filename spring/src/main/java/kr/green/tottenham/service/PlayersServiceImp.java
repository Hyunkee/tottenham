package kr.green.tottenham.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tottenham.dao.PlayersDAO;
import kr.green.tottenham.vo.PlayersVO;
import kr.green.tottenham.vo.StatsVO;

@Service
public class PlayersServiceImp implements PlayersService {
	
	@Autowired
	PlayersDAO playersDao;
	
	@Override
	public ArrayList<PlayersVO> getPlayerPositionList(String position) {
		return playersDao.playerList(position);
	}

	@Override
	public PlayersVO getPlayer(Integer num) {
		return playersDao.selectPlayer(num);
	}	

	@Override
	public ArrayList<StatsVO> getPlayerStats(Integer num) {
		return playersDao.selectStatsNum(num);
	}	
}
