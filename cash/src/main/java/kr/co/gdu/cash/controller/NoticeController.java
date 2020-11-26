package kr.co.gdu.cash.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model, @RequestParam(name="currentPage", defaultValue="1")int currentPage) {
		
		int rowPerPage=10;
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		int countNotice = noticeService.getTotalCountNotice();
		int lastPage = countNotice / rowPerPage;
		if(countNotice % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage); // 마지막 페이지
		model.addAttribute("rowPerPage",rowPerPage); // 몇개의 행을 나타낼지
		model.addAttribute("noticeList",noticeList); // 공지사항 
		return "noticeList";
	}
		
		@GetMapping("/admin/noticeOneDel")
		public String noticeOneDel(@RequestParam(value="noticefileId")int noticefileId,
				@RequestParam(value="noticeId")int noticeId) {
			noticeService.noticefileOneDel(noticefileId);
			return "redirect:/admin/modifyNotice?noticeId="+noticeId;
		}
		// 공지 입력 폼
		@GetMapping("/admin/addNotice")
		public String addNotice() {
			return "addNotice";
		}
		// 공지 입력 액션
		@PostMapping("/admin/addNotice")
		public String addNotice(NoticeForm noticeForm) {
			noticeService.addNotice(noticeForm);
			return "redirect:/admin/noticeList";
		}
		
		// 공지 상세 보기
		@GetMapping("/admin/noticeOne")
		public String noticeOne(Model model, @RequestParam(value = "noticeId") int noticeId) {
			Notice notice = noticeService.getNoticeOne(noticeId); 
			model.addAttribute("notice",notice);
			return "noticeOne";
		}
		
		// 공지 삭제
		@GetMapping("/admin/removeNotice")
		public String removeNotice(@RequestParam(value = "noticeId") int noticeId) {
			noticeService.deleteNotice(noticeId);
			return "redirect:/admin/noticeList";
		}
		
		// 공지 수정 폼
		@GetMapping("/admin/modifyNotice")
		public String modifyNotice(Model model, @RequestParam(value = "noticeId") int noticeId) {
			Notice notice = noticeService.getNoticeOne(noticeId);
			model.addAttribute("notice", notice);
			return "modifyNotice";
		}
		// 공지 수정 액션
		@PostMapping("/admin/modifyNotice")
		public String modifyNotice(NoticeForm noticeForm,@RequestParam(value="noticeId")int noticeId) {
			noticeService.updateNotice(noticeForm);
			return "redirect:/admin/noticeOne?noticeId="+noticeId;
		}
}
