package kr.co.gdu.cash.restcontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashRestService;
import kr.co.gdu.cash.vo.Cashbook;

@RestController
public class CashRestController {
	@Autowired CashRestService cashRestService;
	
	@GetMapping("/cashbookTable/{cashbookKind}")
	public Map<String, Object> cashbookTable(@PathVariable(name="cashbookKind")String cashbookKind){
		System.out.println("cashbookTable");
		Map<String, Object> map = cashRestService.getCashbookYear(cashbookKind);
		return map;
	}
	
	@GetMapping("/cashbookLine/{year}/{cashbookKind}")
	public Map<String, Object> cashbookLine(Model model,
			@PathVariable(name="year")int year,
			@PathVariable(name="cashbookKind")String cashbookKind){
		Map<String, Object> map = cashRestService.getCashbookMonth(year,cashbookKind);
		
		return map;
	}
	
	@GetMapping("/cashbookCategory/{year}")
	public Map<String, Object> cashbookDay(@PathVariable(name="year")int year){
		Map<String, Object> map = cashRestService.getCashbookCategory(year);
		return map;
		
	}
	
	@GetMapping("cashbookCategorySu/{year}")
	public Map<String,Object> cashbookCategorySu(@PathVariable(name="year")int year){
		Map<String,Object> map = cashRestService.getCashbookCategorySu(year);
		return map;
	}
}
