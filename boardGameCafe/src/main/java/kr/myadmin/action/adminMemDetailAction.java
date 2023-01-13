package kr.myadmin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.myadmin.dao.adminMemDAO;
import kr.myadmin.vo.adminMemVO;
import kr.util.StringUtil;

public class adminMemDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//회원번호 반환
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
				
		adminMemDAO dao = adminMemDAO.getInstance();
		adminMemVO detail = dao.getDetail(mem_num);
		
		request.setAttribute("detail", detail);
		
		return "/WEB-INF/views/myadmin/admin_memdetail.jsp";
	}
}
