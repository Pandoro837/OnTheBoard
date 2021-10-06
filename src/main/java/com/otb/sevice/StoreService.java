package com.otb.sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otb.dao.StoreDao;
import com.otb.vo.MatchingVo;
import com.otb.vo.ReservationDateVo;
import com.otb.vo.ReservationTimeVo;
import com.otb.vo.StoreVo;
import com.otb.vo.UserVo;

@Service
public class StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	//매장 리스트
	public List<StoreVo> storeList(){
		System.out.println("[StoreService.storeList()]");
		
		List<StoreVo> storeList = storeDao.storeList();
		
		return storeList;
	}
	
	//매장 키워드 검색
	public List<StoreVo> storeSearchList(String keyword){
		
		System.out.println("[StoreService.storeSearchList]");
		
		List<StoreVo> storeList = storeDao.storeSearchList(keyword);
		
		return storeList;
		
	}
	
	// 유저 예약 페이지 정보
	public Map<String, Object> userDataInfoMap(int userNo) {
		System.out.println("[StoreService.userDataInfoMap]");
		
		List<MatchingVo> userHostMatchingList = storeDao.userHostMatchingList(userNo);
		System.out.println(userHostMatchingList);
		
		Map<String, Object> userDataInfoMap = new HashMap<String, Object>();
		userDataInfoMap.put("userHostMatchingList", userHostMatchingList);
		
		return userDataInfoMap;
	}
	
	//그룹원들 정보 가져오기
	public List<UserVo> grouplist(int matchingno){
		System.out.println("[StoreService.grouplist]");
		
		return storeDao.grouplist(matchingno);
	}
	
	//선택한 날짜의 예약가능시간 정보 가져오기
	public List<ReservationTimeVo> getDateInfo(ReservationDateVo reservationDateVo) {
		System.out.println("[StoreService.getDateInfo]");
		
		int reservationDateNo = storeDao.getDateNo(reservationDateVo);
		System.out.println(reservationDateNo);
		
		List<ReservationTimeVo> reservationableTimeVo = storeDao.getStoreRevTime(reservationDateNo);
		System.out.println("reservationableTimeVo : " + reservationableTimeVo);
		
		return null;
	}
	
}
