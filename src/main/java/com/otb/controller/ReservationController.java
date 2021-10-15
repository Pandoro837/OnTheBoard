package com.otb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otb.sevice.ReservationService;
import com.otb.vo.ReservationDateVo;

@Controller
@RequestMapping(value="/reservation", method = { RequestMethod.GET, RequestMethod.POST })
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@ResponseBody
	@RequestMapping("/reservationinfo/{storeNo}")
	public String reservationinfo(@PathVariable("storeNo")int storeNo, @RequestParam ("checkedTime[]") String[] checkedTime, @RequestParam("matchingNo") int matchingNo, @RequestParam("selectedDate") String selectedDate) {
		
		System.out.println("[reservationController.reservationinfo]");
		
		//선택한 시간대 출력
		for(int i = 0; i < checkedTime.length; i++)  {
			System.out.println("checkedTime" + "[" + i + "] : " + checkedTime[i]);
		}
		
		System.out.println("매칭_그룹번호 : " + matchingNo);
		System.out.println("매장번호 : " + storeNo);
		System.out.println("선택된날짜 : " + selectedDate);
		
		ReservationDateVo revdate = new ReservationDateVo(storeNo, selectedDate);
		
		reservationService.getreservationinfo(matchingNo, checkedTime, revdate);
		
		
		
		return "1";
		
		
		
	}
	
}