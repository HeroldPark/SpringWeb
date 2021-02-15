package com.newlecture.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

public class NoticeService {
	public int removeNoticeAll(int[] ids) {
		return 0;
	}
	
	// 아래 3개를 overload 로 구현한다. 즉, 1개만 제대로 구현한다.
	public int pubNoticeAll(int[] oids, int[] cids) {
		// CSV 형식으로 변경해서 전달..
		List<String> oidsList = new ArrayList<>();
		for(int i=0; i<oids.length; i++)
			oidsList.add(String.valueOf(oids[i]));
		
		List<String> cidsList = new ArrayList<>();
		for(int i=0; i<cids.length; i++)
			cidsList.add(String.valueOf(cids[i]));
		
		return pubNoticeAll(oidsList, cidsList);
	}
	
	public int pubNoticeAll(List<String> oids, List<String> cids) {
		
		String oidsCSV = String.join(",", oids);
		String cidsCSV = String.join(",", cids);
		
		// CSV 형식으로 변경해서 전달..
		return pubNoticeAll(oidsCSV, cidsCSV);
	}
	
	// "20,33,45,47"
	public int pubNoticeAll(String oidsCSV, String cidsCSV) {
		
		int result = 0;
		
		String sqlOpen = String.format("update notice set pub=1 where id in (%s)", oidsCSV) ;
		String sqlClose = String.format("update notice set pub=1 where id in (%s)", cidsCSV) ;
		
		String url = "jdbc:oracle:thin:@localhost:1521/borad";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "lec", "1234567");
			Statement stOpen = con.createStatement();
			result = stOpen.executeUpdate(sqlOpen);
			
			Statement stClose = con.createStatement();
			result += stClose.executeUpdate(sqlClose);
			
			stOpen.close();
			stClose.close();
			con.close();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertNotice(Notice notice) {
		int result = 0;
		String sql = "INSERT INTO NOTICE (TITLE, CONTENT, WRITE_ID, PUB, FILES) VALUES (?, ?, ?, ?, ?)";
		
		// Query 처리...
		
		return result;
	}
	
	public int insertNoticeAll(Notice notice) {
		return 0;
	}
	
	public int deleteNoticeAll(int id) {
		return 0;
	}
	
	public int updateNoticeAll(Notice notice) {
		return 0;
	}
	
	public List<Notice> getNoticeNewestList() {
		return null;
	}
	
	public List<NoticeView> getNoticeViewList() {
		return getNoticeViewList("title", "", 1);
	}
	
	public List<NoticeView> getNoticeViewList(int page) {
		return getNoticeViewList("title", "", page);
	}
	
	// 3개의 method 중 인자가 가장 많은 놈을 구현한다.
	// 3개의 method는 overload 관계가 된다.
	public List<NoticeView> getNoticeViewList(String field, String query, int page) {
		List<NoticeView> list = new ArrayList<NoticeView>();
		
		String sql = "";
		
		String id = rs.getString("ID");
		//----------추가----------------------
		String hit = rs.getString("FILES");
		//String content = rs.getString("CONTENT");
		String cmtCount = rs.getString("CMT_COUNT");
		
		NoticeView notice = new NoticeView(
				id,
				title,
				writerId,
				regdate,
				hit,
				files,
				pub,
				//content,
				cmtCount
		);
		list.add(notice);
		
		return list;
	}
	
	public List<NoticeView> getNoticePubList(String field, String query, int page) {
		List<NoticeView> list = new ArrayList<NoticeView>();
		
		String sql = "SELECT * FROM (" +
				"	SELECT ROWNUM NUM, N.* " +
				"	FROM (SELECT * FROM NOTICE_VIEW WHERE "+field+" LIKE '%%' " +
				") " +
				"WHERE PUB=1 AND NUM BETWEEN ? AND ?"	;
		
		String id = rs.getString("ID");
		//----------추가----------------------
		String hit = rs.getString("FILES");
		//String content = rs.getString("CONTENT");
		String cmtCount = rs.getString("CMT_COUNT");
		
		NoticeView notice = new NoticeView(
				id,
				title,
				writerId,
				regdate,
				hit,
				files,
				pub,
				//content,
				cmtCount
		);
		list.add(notice);
		
		return list;
	}
	
	public int getNoticeCount() {
		return getNoticeCount("title", "");
	}
	
	public int getNoticeCount(String field, String query) {
		return 0;
		
	}
	
	public Notice getNotice(int id) {
		Notice notice = new Notice();
		return notice;
		
	}
	
	public Notice getNextNotice() {
		Notice notice = new Notice();
		return notice;
	}
	
	public Notice getPrevNotice() {
		Notice notice = new Notice();
		return notice;
	}

	public int deleteNoticeAll(int[] ids) {
		int result = 0;
		String params = "";
		for(int i=0; i<ids.length; i++) {
			params += ids[i];
			if(i < ids.length-1)
				params += ",";
	}
		String sql = "DELETE NOTICE WHERE ID IN ("+params+")";
		
		// Query 구현 
		
		return result;
	}

}
