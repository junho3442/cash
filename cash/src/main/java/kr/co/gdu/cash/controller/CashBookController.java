package kr.co.gdu.cash.controller;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class CashBookController {
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	@Autowired private NoticeService noticeService;
	
	@GetMapping("/admin/deleteCashbook/{cashbookId}")
	public String deleteCashbook(@PathVariable(name="cashbookId")int cashbookId) {
		cashbookService.deleteCashbook(cashbookId);
		return "redirect:/admin/cashbookByDay";
	}
	
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model,
			@PathVariable(name="currentPage",required=true)int currentPage) {
		int totalCount = cashbookService.getTotalCountCashbook();
		int rowPerPage = 20;
		int lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage != 0 ) {
			lastPage = lastPage+1;
		}
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("cashbookList",cashbookList);
		return "cashbookList";
	}
	
	@PostMapping("/admin/addCashbook") // 액션
	public String addCashbook(Cashbook cashbook) {
		cashbookService.addCashbook(cashbook);
		
		return "redirect:/admin/cashbookByMonth";
	}
	
	@GetMapping("/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}") // 폼 
	public String addCashbook(Model model,
			@PathVariable(name="currentYear",required=true) int currentYear,	//값이 안들어올시
			@PathVariable(name="currentMonth",required=true) int currentMonth,
			@PathVariable(name="currentDay",required=true) int currentDay ) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "addCashbook";
	}
	
	@PostMapping("/admin/updateCashbook")
	public String updateCashbook(Cashbook cashbook,
			@PathVariable(name="cashbookId")int cashbookId,
			@PathVariable(name="currentYear",required=true) int currentYear,	//값이 안들어올시
			@PathVariable(name="currentMonth",required=true) int currentMonth,
			@PathVariable(name="currentDay",required=true) int currentDay) {
		
		cashbookService.updateCashbook(cashbook);
		return "redirect:/admin/cashbookByDay";
	}
	
	@GetMapping("/admin/updateCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}") // 업데이트 폼
	public String updateCashbook(Model model,
			@PathVariable(name="cashbookId")int cashbookId,
			@PathVariable(name="currentYear",required=true) int currentYear,	//값이 안들어올시
			@PathVariable(name="currentMonth",required=true) int currentMonth,
			@PathVariable(name="currentDay",required=true) int currentDay) {
		
		Cashbook cashbook = cashbookService.selectCashbookOne(cashbookId);
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth",currentMonth);
		model.addAttribute("currentDay",currentDay);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cashbook", cashbook);
		return "updateCashbook";	
	}
	
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name="target", required = false) String target,
			@PathVariable(name="currentYear",required=true) int currentYear,	//값이 안들어올시
			@PathVariable(name="currentMonth",required=true) int currentMonth,
			@PathVariable(name="currentDay",required=true) int currentDay) {
		
		
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);
		targetDay.set(Calendar.DATE, currentDay);
		
		if(target.equals("pre")) {
			
			targetDay.add(Calendar.DATE,-1);
		}else if(target.equals("next")) {
			
			targetDay.add(Calendar.DATE,1);
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONTH)+1, targetDay.get(Calendar.DATE));
		
		
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth",targetDay.get(Calendar.MONTH)+1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));
		return "cashbookByDay";
	}
	
	@GetMapping(value="/admin/cashbookByMonth/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model,
			@PathVariable(name="currentYear") int currentYear,  
			@PathVariable(name="currentMonth") int currentMonth) { 
		
		//2020-11-02
		Calendar currentDay = Calendar.getInstance();
		if(currentYear != -1 && currentMonth != -1) {
			if(currentMonth ==0) {
				currentMonth = 12;
				currentYear -= 1;
			}
			if(currentMonth == 13) {
				currentMonth = 1;
				currentYear += 1;
			}
			currentDay.set(Calendar.YEAR,currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		currentDay.set(Calendar.DATE, 1);
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH)+1;
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek =currentDay.get(Calendar.DAY_OF_WEEK);
		
		int sumIn = cashbookService.selectSumCashbookPriceByInOut("수입",currentYear, currentMonth);
		int sumOut = cashbookService.selectSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		
		List<Notice> notice = noticeService.getNoticeList();
		
		model.addAttribute("notice", notice);
		model.addAttribute("currentYear",currentYear);
		model.addAttribute("currentMonth",currentMonth);
		model.addAttribute("lastDay",lastDay);
		model.addAttribute("firstDayOfWeek",firstDayOfWeek);
		
		model.addAttribute("cashList",cashList);
		model.addAttribute("sumIn", sumIn);
		model.addAttribute("sumOut",sumOut);
		return "cashbookByMonth";
	}
}
