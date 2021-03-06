package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.MemberRestService;

@RestController
public class MemberRestController {
	@Autowired private MemberRestService memberRestService;
	
	@PostMapping("/admin/idCheck")
	public String idCheck(@RequestParam(value="id")String id) {
		String returnId = memberRestService.getMemberId(id);
		System.out.print(returnId);
		if(returnId == null) {
			return "yes"; // data값
		}
		
		return "no"; // data값
	}
	
	
}
