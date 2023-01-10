package kr.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import kr.order.vo.OrderVO;
import kr.util.DBUtil;

public class OrderDAO {
	private static OrderDAO instance = new OrderDAO();
	
	public static OrderDAO getInstance() {
		return instance;
	}
	private OrderDAO() {}
	
	//주문등록
	public void insertOrder(OrderVO order)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "INSERT INTO order_main (order_main_num,receive_name,receive_zipcode,receive_address1,receive_address2,receive_phone,notice,mem_num) VALUES (order_main_seq.nextval,?,?,?,?,?,?,?)";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, order.getReceive_name());
			pstmt.setString(2, order.getReceive_zipcode());
			pstmt.setString(3, order.getReceive_address1());
			pstmt.setString(4, order.getReceive_address2());
			pstmt.setString(5, order.getReceive_phone());
			pstmt.setString(6, order.getNotice());
			pstmt.setInt(7, order.getMem_num());
			//SQL문 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
	}
	//관리자 - 전체 글 개수/검색글 개수
	//관리자 - 목록/검색글 목록
	//사용자 - 전체 글 개수/검색글 개수
	//사용자 - 목록/검색글 목록
	//개별 상품 목록
	//주문 삭제(삭제 시 재고를 원상 복귀시키지 않음, 주문 취소일 때 원상 복귀)
	//관리자/주문자 주문 상세
	//주문 수정 
	
	
	
	
	
}
