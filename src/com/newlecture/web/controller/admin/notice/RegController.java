package com.newlecture.web.controller.admin.notice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.service.NoticeService;

@MultipartConfig(
		// location="/tmp",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)
@WebServlet("/admin/board/notice/reg")
public class RegController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// redirect
		// forward
		request.getRequestDispatcher("/WEB-INF/view/admin/board/notice/reg.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isOpen = request.getParameter("open");
		
		Collection<Part> parts = request.getParts();
		StringBuilder builder = new StringBuilder();
		for(Part p : parts) {
			if(p.getName().equals("file"))	 continue;
			if(p.getSize() == 0)	continue;	// 파일이 선택되지 않거나 한개만 선택될떄.
			
			//Part filePart = request.getPart("file");	// 단일 파일일때..
			Part filePart = p;
			String fileName = filePart.getSubmittedFileName();
			builder.append(fileName);
			builder.append(",");
			InputStream fis = filePart.getInputStream();
			
			// /upload -> 실제경로로..
			String realPath = request.getServletContext().getRealPath("/upload");
			System.out.println(realPath);
			
			File path = new File(realPath);
			if(!path.exists())
				path.mkdirs();
			
			String filePath = realPath + File.pathSeparator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size=fis.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
			fos.close();
			fis.close();
		}
		
		// "abcdef," 에서 마지막의 ,를 뺀다.
		builder.delete(builder.length()-1, builder.length());

		boolean pub = false;
		if(isOpen != null)
			pub = true;
		
		//System.out.println(title+", "+ content+", "+isOpen);	// 값 전달 상태 체크 
		response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		out.printf("title : %s<br>", title);
		out.printf("content : %s<br>", content);
		out.printf("open : %s<br>", isOpen);
		//////////////////////////////////////////////////////////////////////////////////////////
		
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setPub(pub);
		notice.setWriteId("admin");
		notice.setFiles(builder.toString());
		
		NoticeService service = new NoticeService();
		int result = service.insertNotice(notice);
		
		response.sendRedirect("list"); // 이렇게 하게 되면 @WebServlet("/admin/board/notice/reg") 에서 reg 대신 list로 호출된다.
	}
}
