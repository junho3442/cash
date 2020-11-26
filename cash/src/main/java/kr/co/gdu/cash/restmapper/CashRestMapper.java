package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashRestMapper {
	public Map<String, Object> cashbookYearList(String cashbookKind);
	
	public Map<String, Object> cashbookMonthList(Map<String, Object> map);
	
	public Map<String, Object> cashbookCategory(int year);
	
	public Map<String, Object> cashbookCategorySu(int year);
}
