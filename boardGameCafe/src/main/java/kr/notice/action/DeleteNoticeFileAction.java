package kr.notice.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;
import kr.util.FileUtil;
 
public class DeleteNoticeFileAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		//HttpSession session = request.getSession();
		//Integer user_num = (Integer)session.getAttribute("user_num");
		//if(user_num==null) {//�α����� ���� ���� ���
		//	mapAjax.put("result", "logout");
		//}else {//�α��� �� ���
			int noti_num = Integer.parseInt(request.getParameter("noti_num"));
			
			NoticeDAO dao = NoticeDAO.getInstance();
			NoticeVO notice = dao.getNotice(noti_num);
			
			//if(user_num!=db_board.getMem_num()) {
				//�α����� ����� �ۼ��ڰ� ����ġ�� ���
				//mapAjax.put("result", "wrongAccess");
			//}else {
				//�α����� ����� �ۼ��� ��ġ
				dao.deleteFile(noti_num);
				//���� ����
				FileUtil.removeFile(request, notice.getNoti_file());
				mapAjax.put("result", "success");
			//}
		//}
		
		//JSON ������ ����
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
}