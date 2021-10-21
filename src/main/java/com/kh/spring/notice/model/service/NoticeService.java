package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notice.model.vo.PageInfo;

public interface NoticeService {

	int selectNListCount();

	ArrayList<Notice> selectNList(PageInfo pi);

	Notice selectNBoard(int bno);

	void insertNBoard(Notice n);

	void updateNBoard(Notice n);

	void deleteNBoard(int bno);

}
