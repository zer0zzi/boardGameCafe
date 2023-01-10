package kr.list.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class GameAdminAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer mem_id = (Integer)session.getAttribute("mem_id");
		if(mem_id == null) {//로그인 되지 않은 경우  (다 여기로 들어와짐) (if문 안 됨)
			return "/WEB-INF/views/game/admin.jsp"; //로그인하는 페이지 경로 적어주기.
		}
		
		Integer mem_auth = (Integer)session.getAttribute("mem_auth");
		if(mem_auth<9) {//관리자로 로그인하지 않은 경우
			return "/WEB-INF/views/game/admin.jsp";  //알려주는 페이지 경로 적어주기.
		}
		//관리자로 로그인한 경우
		return "/WEB-INF/views/game/admin.jsp";
	}

}

//관리자로 로그인하면 게임등록 보이는 헤더 보여주고 게임 관리 버튼 누르면 admin.jsp(게임 목록)페이지 보여줌.????
