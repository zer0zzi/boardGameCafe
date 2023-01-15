package kr.myadmin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.myadmin.dao.adminMemDAO;
import kr.myadmin.vo.adminMemVO;
import kr.util.PagingUtil;

public class adminMemListAction implements Action{

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//페이지 번호 반환
	    String pageNum = request.getParameter("pageNum");
	    if(pageNum == null) pageNum = "1";
	     
	    adminMemDAO dao = adminMemDAO.getInstance();
	    int count = dao.getCount();
	      
	    //페이지 처리
	    //currentPage(현재페이지), count(전체 게시물 개수), rowCount(한 페이지의 게시물 개수), pageCount(한 화면에 보여줄 페이지 개수), url(호출 페이지 url)
	    PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 10, 10, "memList.do");
	      
	    List<adminMemVO> list = null;
	    if (count > 0) {
	       list = dao.getList(page.getStartRow(), page.getEndRow());
	    }
	      
	    request.setAttribute("list", list);
	    request.setAttribute("count", count);
	    request.setAttribute("pagingHtml", page.getPage());
	      
	      
	    //JSP 경로 반환
		return "/WEB-INF/views/myadmin/admin_memlist.jsp";
	}
}