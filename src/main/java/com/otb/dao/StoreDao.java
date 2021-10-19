package com.otb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.otb.vo.GameVo;
import com.otb.vo.MatchingVo;
import com.otb.vo.ReservationDateVo;
import com.otb.vo.ReservationTimeVo;
import com.otb.vo.RevInfoVo;
import com.otb.vo.StoreVo;
import com.otb.vo.UserVo;

@Repository
public class StoreDao {

	@Autowired
	private SqlSession sqlSession;
	
	//매장 리스트
	public List<StoreVo> selectStoreList(){
		
		System.out.println("[StoreDao.storeList]");
		
		List<StoreVo> storeList = sqlSession.selectList("store.selectStoreList");
		
		return storeList;
	};
	
	//매장 키워드 검색
	public List<StoreVo> storeSearchList(String keyword){
		
		System.out.println("[StoreDao.storeSearchList]");
		
		return sqlSession.selectList("store.searchList",keyword);
		
	}

	//매장 키워드 검색
	public List<StoreVo> storeSearchList(int gameNo){
		
		System.out.println("[StoreDao.storeSearchList] - 게임 번호 검색");
		
		return sqlSession.selectList("store.gameOwnedList",gameNo);
		
	}
	
	// 호스트인 유저의 매칭 리스트
	public List<MatchingVo> userHostMatchingList(int userNo) {
		
		System.out.println("[StoreDao.userHostMatchingList]");
		
		List<MatchingVo> userHostMatchingList = sqlSession.selectList("matching.userHostMatchingList", userNo);
		System.out.println(userHostMatchingList);
		
		return userHostMatchingList;
	}
	
	//매장정보
	public StoreVo getstoreInfo(int storeNo) {
		System.out.println("[storeDao.getstoreInfo]");
		
		StoreVo storeInfo = sqlSession.selectOne("getstoreInfo", storeNo);
		
		System.out.println("스토어다오_매장정보 : " + storeInfo);
		
		return storeInfo;
	}
	
	//그룹원들 정보 가져오기
	public List<UserVo> grouplist(int matchingno){
		System.out.println("[StoreDao.grouplist]");
		
		return sqlSession.selectList("store.getgrouplist",matchingno);
	}
	
	//매장번호, 날짜데이터로 예약날짜번호 값 가져오기
	public int getDateNo(ReservationDateVo reservationDateVo){
		System.out.println("[StoreDao.getDateInfo]");
		
		return sqlSession.selectOne("store.getDateInfo",reservationDateVo);
	}
	
	

	//매장번호, 날짜데이터로 예약날짜번호 값 가져오기
	public int getDateNo2(RevInfoVo revInfoVo){
		System.out.println("[StoreDao.getDateInfo2]");
		
		return sqlSession.selectOne("store.getDateInfo2",revInfoVo);
	}
	
	
	
	//예약날짜번호 값으로 해당 매장 예약가능 시간대 정보 가져오기
	public List<ReservationTimeVo> getStoreRevTime(int reservationDateNo) {
		System.out.println("[StoreDao.getStoreRevTime]");
		
		List<ReservationTimeVo> reservationableTimeList = sqlSession.selectList("store.getStoreRevTime",reservationDateNo);
		
		System.out.println("reservationableTimeList : " + reservationableTimeList);
		
		return reservationableTimeList;
	}
	
	//매장 게임 리스트
	public List<GameVo> ownedGameList(int storeNo) {
	      
	      List<GameVo> ownedGameList = sqlSession.selectList("store.ownedGameList", storeNo);
	      
	      return ownedGameList;
	   }
	
}
