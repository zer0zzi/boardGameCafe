package kr.room.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.room.dao.RoomDAO;
import kr.room.vo.RoomVO;
import kr.util.StringUtil;

public class RoomDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int room_num = Integer.parseInt(request.getParameter("room_num"));
		
		RoomDAO dao = RoomDAO.getInstance();
		RoomVO room = dao.getRoom(room_num);
		
		//¡ŸπŸ≤ﬁ√≥∏Æ
		room.setRoom_detail(StringUtil.useBrHtml(room.getRoom_detail()));
		
		request.setAttribute("room", room);
		
		return "/WEB-INF/views/room/roomDetail.jsp";
	}

}
