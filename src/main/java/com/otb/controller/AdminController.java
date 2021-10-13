package com.otb.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otb.sevice.AdminService;
import com.otb.vo.ReservationDateVo;
import com.otb.vo.StoreVo;
import com.otb.vo.UserVo;

@Controller
@RequestMapping(value="/admin", method = {RequestMethod.GET, RequestMethod.POST})
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
//	//admin - 메인 화면
//	@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
//	public String main(HttpSession session) {
//		//System.out.println("admin - main --------------------------------------------------------");
//		
//		UserVo authUser = (UserVo) session.getAttribute("authUser");
//		
//		if(authUser != null) {
//			
//			int userNo = authUser.getUserNo();
//			
//			StoreVo storeVo = adminService.getStore(userNo);
//			
//			if(storeVo != null) {
//				return "/admin/main";
//			} else {
//				return "/admin/storeInfo";
//			}
//			
//		} else {
//			return "/admin/error";
//		}
//		
//	}
	
	//admin - 예약 관리
	@RequestMapping(value = "/reservation", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservation() {
		//System.out.println("admin - reservation --------------------------------------------------------");
		return "/admin/reservation";
	}

	//admin - 스케쥴
	@RequestMapping(value = "/schedule", method = {RequestMethod.GET, RequestMethod.POST})
	public String schedule() {
		//System.out.println("admin - schedule --------------------------------------------------------");
		return "/admin/schedule";
	}

	//schedule - 등록(ajax)
	@ResponseBody
	@RequestMapping(value = "/scheduleInsert", method = {RequestMethod.GET, RequestMethod.POST})
	public void scheduleInsert(@RequestParam("date") String date, @RequestParam("times[]") String[] times,@ModelAttribute ReservationDateVo reservationDateVo, HttpSession session) {
//		System.out.println("스케쥴 인서트 도착");
//		System.out.println(date);
//		System.out.println(reservationDateVo.toString());
		
		int storeNo = ((StoreVo)session.getAttribute("storeInfo")).getStoreNo();
		reservationDateVo.setStoreNo(storeNo);
		
		System.out.println(reservationDateVo.toString());
		
		adminService.addSchedule(date, times, reservationDateVo);
	}
	
	//schedule - 조회(ajax)
	@ResponseBody
	@RequestMapping(value = "/scheduleLookup", method = {RequestMethod.GET, RequestMethod.POST})
	public void scheduleLookup() {
		
	}
	
	//////////////////////////////////////// 매장 정보 등록 및 수정 ////////////////////////////////////////
	
	//admin - 매장 정보	- main으로 변경
	@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
	public String storeInfo(HttpSession session) {
		
		//System.out.println("admin - storeInfo --------------------------------------------------------");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		if(authUser != null) {
			int userNo = authUser.getUserNo();
			StoreVo storeInfo = adminService.getStore(userNo);
			
			//System.out.println(storeInfo.toString());
			
			session.setAttribute("storeInfo", storeInfo);
			
			return "/admin/storeInfo";
			
		} else {
			return "/admin/error";
		}
	
	}
	
	//store-info 등록
	@RequestMapping(value = "/storeInfoInsert", method = {RequestMethod.GET, RequestMethod.POST})
	public String storeInfoInsert(@ModelAttribute StoreVo storeInfo, HttpSession session) {
		System.out.println("매장 정보 업데이트");
		
		int userNo = ((UserVo) session.getAttribute("authUser")).getUserNo();
		storeInfo.setUserNo(userNo);
		
		System.out.println(storeInfo.toString());
		
		adminService.registerStoreInfo(storeInfo);
		
		return "redirect:/admin/main";
	}
	
	//store-info 수정
	@RequestMapping(value = "/storeInfoModify", method = {RequestMethod.GET, RequestMethod.POST})
	public String storeInfoModify(@ModelAttribute StoreVo storeInfo, HttpSession session) {
		System.out.println("매장 정보 업데이트");
		
		int userNo = ((UserVo) session.getAttribute("authUser")).getUserNo();
		storeInfo.setUserNo(userNo);
		
		System.out.println(storeInfo.toString());

		adminService.modifyStoreInfo(storeInfo);
		
		return "redirect:/admin/main";
	}
	
	//////////////////////////////////////// 매장 정보 등록 및 수정 ////////////////////////////////////////

	
	//admin - 보유 게임관리
	@RequestMapping(value = "/gameList", method = {RequestMethod.GET, RequestMethod.POST})
	public String gameList() {
		System.out.println("admin - gameList --------------------------------------------------------");
		return "/admin/gameList";
	}

	//admin - 보유 게임관리
	@RequestMapping(value = "/status", method = {RequestMethod.GET, RequestMethod.POST})
	public String status() {
		System.out.println("admin - status --------------------------------------------------------");
		return "/admin/status";
	}
	
}
