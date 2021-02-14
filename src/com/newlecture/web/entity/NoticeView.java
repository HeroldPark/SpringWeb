package com.newlecture.web.entity;

import java.util.Date;

public class NoticeView extends Notice {

	private int cmtCount;
	
	public int getCmtCount() {
		return cmtCount;
	}

	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}

	public NoticeView() {
		//super();
		// TODO Auto-generated constructor stub
	}

	public NoticeView(int id, String title, String writeId, Date regdate, String hit, String files, boolean pub, String content) {
		super(id, title, writeId, regdate, hit, files, "", pub);
		// TODO Auto-generated constructor stub
		this.cmtCount = cmtCount;
	}
	
}
