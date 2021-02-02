package kr.co.gdu.cash.service;

import java.io.File;
import java.util.*;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	private final String PATH ="C:\\sts-work\\fileuploadtest\\src\\main\\webapp\\upload\\";
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	@Autowired private CommentMapper commentMapper;
	
	//공지사항 수정
	public void updateNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		noticeMapper.updateNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile() != null) { // noticefile이 있다면 
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId()); //noticeId -> noticefileId
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	
	//공지사항 삭제
	public void deleteNotice(int noticeId) {
		List<String> noticefileNameList = noticefileMapper.selectNoticefileNameList(noticeId);
		for(String s: noticefileNameList) {
			File file = new File(PATH+s);
			if(file.exists()) {
				file.delete();
			}
		}
		commentMapper.deleteAllComment(noticeId);
		noticefileMapper.deleteNoticefile(noticeId);
		noticeMapper.deleteNotice(noticeId);
	}
	
	//공지사항 추가
	public void addNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		notice.setNoticeWriter(noticeForm.getNoticeWriter());
		noticeMapper.insertNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()){
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefile.add(nf);
				
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	
	
	public Map<String, Object> getNoticeAndInOutList() {
		
		List<Notice> noticeList = noticeMapper.selectNoticeList();
		
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		
		return map;
	}
	
	//페이징
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		//NoticeMapper #{?} 
		map.put("beginRow", (currentPage-1)*rowPerPage); //몇번째 행부터 보여줄지
		map.put("rowPerPage", rowPerPage); // 몇개의 행을 보여줄지
		
		return noticeMapper.selectNoticeListByPage(map);
	 
	}
	
	// 처음화면 공지사항
	public List<Notice> getNoticeList(){
		return noticeMapper.selectNoticeList();
	}
	
	//페이징에 사용하기위한 총 행의갯수
	public int getTotalCountNotice() {
		return noticeMapper.totalCountNotice();
	}
	
	//공지사항 자세히 보기
	public Notice getNoticeOne(int noticeId){
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	
	public int noticefileOneDel(int noticefileId) {
		return noticefileMapper.deleteOneNoticefile(noticefileId);
	}
	
}
