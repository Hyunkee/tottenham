package kr.green.tottenham.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.tottenham.vo.PlayersVO;
import kr.green.tottenham.vo.StatsVO;

public interface PlayersDAO {

	ArrayList<PlayersVO> playerList(@Param("position")String position);

	PlayersVO selectPlayer(Integer num);
	
	ArrayList<StatsVO> selectStatsNum(Integer num);

}
