package com.otb.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otb.sevice.MatchingService;
import com.otb.sevice.StoreService;
import com.otb.vo.ReservationDateVo;
import com.otb.vo.StoreVo;
import com.otb.vo.UserVo;

@Controller
@RequestMapping(value = "/store", method = { RequestMethod.GET, RequestMethod.POST })
public class StoreController {

	@Autowired
	private StoreService storeService;
	@Autowired
	private MatchingService matchingService;

	// 매장 리스트
	@RequestMapping("/storelist")
	public String storelist(Model model) {
		System.out.println("[StoreController.storelist]");
		List<StoreVo> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		Map<String, Object> tabContent = matchingService.tabContent();
		model.addAttribute("tabContent", tabContent);
		
		return "/store/storelisttest";
	}

	// 매장 검색
	@ResponseBody
	@RequestMapping("/storesearchlist")
	public List<StoreVo> storeSearchList(@RequestParam(value = "keyword", defaultValue = "") String keyword,
										 @RequestParam(value = "gameNo", defaultValue = "0") int gameNo	) {
		
		System.out.println("[StoreController.storesearchlist]");
		System.out.println(keyword);
		List<StoreVo> searchlist;
		if(gameNo != 0) {
			System.out.println(gameNo);
			searchlist = storeService.getOwnedStoreList(gameNo);
		} else {
			searchlist = storeService.storeSearchList(keyword);
		}

		System.out.println(searchlist);

		return searchlist;

	}

	// 매장 상세정보 페이지
	@RequestMapping("/storeinfo/{storeNo}")
	public String storeinfo(@PathVariable("storeNo") int storeNo, HttpSession session, Model model) {
		System.out.println("[storeController.storeinfo]");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		if(authUser != null) {
			System.out.println(authUser);
			
			int userNo = authUser.getUserNo();
			System.out.println(userNo);
			
			Map<String, Object> userDataInfoMap = storeService.userDataInfoMap(userNo);
			System.out.println(userDataInfoMap);
			model.addAttribute("userDataInfoMap", userDataInfoMap);
		}
		
		Map<String, Object> storeInfo = storeService.storeInfo(storeNo);
		
		System.out.println("스토어컨트롤러_매장정보 : " + storeInfo);
		
		model.addAttribute("storeInfo", storeInfo);
		
		/* model.addAttribute("storeNo", storeNo); */
		
		return "/store/storeinfo";

	}

	// 그룹넘버에 따른 그룹원 정보 목록 가져오기
	@ResponseBody
	@RequestMapping("/grouplist")
	public List<UserVo> grouplist(@RequestParam(value = "matchingno") int matchingno) {

		System.out.println("[StoreController.grouplist]");

		System.out.println(matchingno);

		List<UserVo> grouplistinfo = storeService.grouplist(matchingno);
		System.out.println(grouplistinfo);

		
		
		return grouplistinfo;
	}
	
	// 매장번호와 날짜데이터를 받아와서 예약가능 시간대 정보를 반환해준다.
	@ResponseBody
	@RequestMapping("/getStoreRevTime")
	public String[] getStoreRevTime(@ModelAttribute("storeRevTimeVo")ReservationDateVo reservationDateVo) {
		System.out.println("[StoreController.getStoreRevTime]");
		
		System.out.println("reservationDateVo : " + reservationDateVo);
		
		String[] reservationableTimeList = storeService.getDateInfo(reservationDateVo);
		
		for(int i = 0; i < reservationableTimeList.length; i++) {
			System.out.println("reservationableTimeList : " + reservationableTimeList[i]);
		}
		
		return reservationableTimeList;
	}
	
}
