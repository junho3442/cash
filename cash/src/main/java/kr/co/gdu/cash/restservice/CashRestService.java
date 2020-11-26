package kr.co.gdu.cash.restservice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdu.cash.restmapper.CashRestMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
public class CashRestService {
	@Autowired CashRestMapper cashRestMapper;
	
	public Map<String, Object> getCashbookYear(String cashbookKind){
		return cashRestMapper.cashbookYearList(cashbookKind);
	}
	
	public Map<String, Object> getCashbookMonth(int year, String cashbookKind){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("cashbookKind", cashbookKind);
		
		return cashRestMapper.cashbookMonthList(map);
	}
	
	public Map<String, Object> getCashbookCategory(int year){
		return cashRestMapper.cashbookCategory(year);
	}
	
	public Map<String, Object> getCashbookCategorySu(int year){
		return cashRestMapper.cashbookCategorySu(year);
	}
}
