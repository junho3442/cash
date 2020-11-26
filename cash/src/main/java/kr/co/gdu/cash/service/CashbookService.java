package kr.co.gdu.cash.service;

import java.util.*;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
	public int deleteCashbook(int cashbookId) {
		return cashbookMapper.deleteCashbook(cashbookId);
	}
	
	public int getTotalCountCashbook() {
		return cashbookMapper.totalCountCashbook();
	}
	
	public List<Cashbook> getCashbookList(){
		return cashbookMapper.selectCashbookList();
	}
	
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return cashbookMapper.selectCashbookListByPage(map);
	}
	
	//cashbook 수정
	public int updateCashbook(Cashbook cashbook) {
		return cashbookMapper.updateCashbook(cashbook);
		
	}
	
	public Cashbook selectCashbookOne(int cashbookId){
		return cashbookMapper.selectCashbookOne(cashbookId); 
	}
	
	public int addCashbook(Cashbook cashbook) {
		return cashbookMapper.insertCashbook(cashbook);
	}
	
	public int selectSumCashbookPriceByInOut(String cashbookKind,int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		Integer sum = cashbookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
	
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth",currentMonth);
		return cashbookMapper.selectCashListByMonth(map);
	}
	
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth",currentMonth);
		map.put("currentDay",currentDay);
		
		return cashbookMapper.selectCashBookListByDay(map);
	}
	
	}
