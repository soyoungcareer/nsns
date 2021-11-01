package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.facility.model.vo.searchFac;
import com.kh.spring.lecture.model.vo.Reply;
import com.kh.spring.lecture.model.vo.lecture;
import com.kh.spring.lecture.model.vo.lectureList;
import com.kh.spring.lecture.model.vo.lectureListwo;

public interface LecService {

	ArrayList<lecture> selectList(int id);

	ArrayList<lectureListwo> lecPageSub(int no);

	lectureList lecPageFinal(int no);

	void lecinsert(lectureList l);

	ArrayList<Reply> selectReplyList(int bno);

	int insertReply(Reply r);

	void insertTime(searchFac sf);

	ArrayList<lectureListwo> selectProfList(searchFac sf);


}
