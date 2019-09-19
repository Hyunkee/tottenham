package kr.green.tottenham.service;

import java.util.ArrayList;

import kr.green.tottenham.vo.PlayersVO;

public interface PlayersService {
	ArrayList<PlayersVO> getPlayerPositionList(String position);

	PlayersVO getPlayer(Integer num);

}
