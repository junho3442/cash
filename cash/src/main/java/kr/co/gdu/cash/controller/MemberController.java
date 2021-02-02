package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.vo.Member;

@Controller
@Transactional
public class MemberController {
	@Autowired MemberService memberService;
	
	@GetMapping("/admin/addMember")
	public String addMember() {
		
		return "addMember";
	}
	
	@PostMapping("/admin/addMember")
	public String addMember(Member member) {
		memberService.getAddMember(member);
		return "redirect:/";
	}
}
