package com.otb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.otb.vo.GameVo;
import com.otb.vo.StoreVo;
import com.otb.vo.ThemeVo;

@Repository
public class GameDao {

	@Autowired
	private SqlSession sqlSession;
	
	//게임목록
	public List<GameVo> gameList(){
		System.out.println("[GameDao.gamelist]");
		
		List<GameVo> gameList = sqlSession.selectList("game.list");
		System.out.println(gameList);
		
		return gameList;
	}

	//게임상세정보
	public GameVo gameDetails(int gameNo) {
		System.out.println("[GameDao.gameRead]");
		
		GameVo gameVo = sqlSession.selectOne("game.read", gameNo);
		
		System.out.println(gameVo);

		return gameVo;
	}
	
	//게임등록
	public int gameUpload(GameVo gameVo) {
		System.out.println("[GameDao: gameUpload]");
		
		int gameUpload = sqlSession.insert("game.write",gameVo);

		return gameUpload;
	}
	
	//매장 등록용 게임 리스트
	public List<GameVo> selectStoreGameList(Map<String, Object> pageMap) {
		return sqlSession.selectList("game.storeGameList", pageMap);
	}
	
	//게임 리스트 카운트
	public int selectCnt() {
		return sqlSession.selectOne("game.selectCnt");
	}
	
	//테마 호출
	public List<ThemeVo> selectThemeList() {
		return sqlSession.selectList("game.selectThemeList");
	}
	
	//보유한 매장 호출
	public List<StoreVo> selectOwnedStoreList(int gameNo) {
		return sqlSession.selectList("game.selectOwnedStoreList", gameNo);
	}
	
}
