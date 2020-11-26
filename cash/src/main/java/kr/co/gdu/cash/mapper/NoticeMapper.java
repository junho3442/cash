package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper
public interface NoticeMapper {
	List<Notice> selectNoticeList();	// 추상메서드(접근자 생략)
	
	List<Notice> selectNoticeListByPage(Map<String, Integer> map); // 페이징
	int totalCountNotice(); //페이징
	
	Notice selectNoticeOne(int noticeId); //공지사항 자세히 보기
	
	int insertNotice(Notice notice); //공지사항 추가
	
	int updateNotice(Notice notice); //공지사항 수정
	
	int deleteNotice(int noticeId); //공지사항 삭제
	
}
