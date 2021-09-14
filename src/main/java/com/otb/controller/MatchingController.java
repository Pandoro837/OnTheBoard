package com.otb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/matching", method = {RequestMethod.GET, RequestMethod.POST})
public class MatchingController {
	
	// 매칭리스트
	@RequestMapping("/list")
	public String list() {
		
		return "/matching/list";
	}
	
	// 매칭글 쓰기폼
	@RequestMapping("/writeForm")
	public String write() {
		
		return "/matching/writeForm";
	}
	
	// 매칭글 읽기
	@RequestMapping("/read")
	public String read() {
		
		return "/matching/read";
	}
	
	// 매칭글 수정폼
	@RequestMapping("/modifyForm")
	public String modify() {
		
		return "/matching/modifyForm";
	}

}
