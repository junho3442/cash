package kr.co.gdu.cash.vo;

import lombok.Data;

@Data
public class Noticefile {
	private int noticefileId;
	private int noticeId;
	private String noticefileName;
	private long noticefileSize;
	private String noticefileType;
}
