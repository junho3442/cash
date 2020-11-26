package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;



@Mapper
public interface CashbookMapper {
	
	List<Map<String, Object>> selectCashInOutList();
	
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map); 
	
	List<Map<String, Object>> selectCashListByMonth(Map<String,Object> map); //2개의 값을 리턴하지 못해 map사용 
	
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
	
	Cashbook selectCashbookOne(int cashbookId);
	
	int insertCashbook(Cashbook cashbook);
	
	int updateCashbook(Cashbook cashbook);
	
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map); // beginRow, rowPerPage
	
	List<Cashbook> selectCashbookList();
	
	int deleteCashbook(int cashbookId);
	
	int totalCountCashbook();
	
	
}
