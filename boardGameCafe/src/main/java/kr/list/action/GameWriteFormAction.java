package kr.list.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class GameWriteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer mem_id = (Integer)session.getAttribute("mem_id");
		if(mem_id == null) {//로그인 되지 않은 경우	(if문 작동 안됨)(다 여기로 들어옴)
			return "/WEB-INF/views/game/admin_gameWrite.jsp"; //로그인하는 페이지 경로 적어주기.
		}
		
		Integer mem_auth = (Integer)session.getAttribute("mem_auth");
		if(mem_auth<9) {//관리자로 로그인하지 않은 경우
			return "";  //알려주는 페이지 경로 적어주기.
		}
		//관리자로 로그인한 경우
		return "/WEB-INF/views/game/admin_gameWrite.jsp";
	}

}
//관리자가 게임 관리 메뉴에 있는 게임 등록 누르면 관리자 체크 하고 게임 등록하는 폼으로 보내줌. 