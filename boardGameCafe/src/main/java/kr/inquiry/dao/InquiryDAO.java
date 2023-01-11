package kr.inquiry.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.inquiry.vo.InquiryVO;
import kr.util.DBUtil;

public class InquiryDAO {
	//싱글턴 패턴
	private static InquiryDAO instance = new InquiryDAO();
			
	public static InquiryDAO getInstance() {
		return instance;
	}
		
	private InquiryDAO() {}
	
	//문의 글 등록
	public void insertInquiry(InquiryVO inquiry) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String inqu_cate = null;
		
		try {
			conn = DBUtil.getConnection();
			
			if((inquiry.getInqu_cate()).equals("1")) {
				inqu_cate = "예약문의";
			} else if((inquiry.getInqu_cate()).equals("2")){
				inqu_cate = "상품문의";
			} else if((inquiry.getInqu_cate()).equals("3")){
				inqu_cate = "주문/배송문의";
			} else {
				inqu_cate = "기타문의";
			}
			
			sql = "insert into inquiry (inqu_num, mem_num, inqu_cate, inqu_title, inqu_content, inqu_file, inqu_check)"
				+ "values (inquiry_seq.nextval, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, inquiry.getMem_num());
			pstmt.setString(2, inqu_cate);
			pstmt.setString(3, inquiry.getInqu_title());
			pstmt.setString(4, inquiry.getInqu_content());
			pstmt.setString(5, inquiry.getInqu_file());
			pstmt.setInt(6, inquiry.getInqu_check());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//문의 글 개수
	public int getCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			
			sql = "select count(*) from inquiry";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	//문의 글 목록
	public List<InquiryVO> getInquiryList(int startRow, int endRow) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<InquiryVO> list = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "select * from (select a.*, rownum rnum from (select * from inquiry order by inqu_num desc) a) where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<InquiryVO>();
			while(rs.next()) {
				InquiryVO inquiry = new InquiryVO();
				
				inquiry.setInqu_num(rs.getInt("inqu_num"));
				inquiry.setInqu_cate(rs.getString("inqu_cate"));
				inquiry.setInqu_title(rs.getString("inqu_title"));
				inquiry.setInqu_hit(rs.getInt("inqu_hit"));
				inquiry.setInqu_check(rs.getInt("inqu_check"));
				inquiry.setInqu_reg_date(rs.getDate("inqu_reg_date"));
				
				list.add(inquiry);
			}
		} catch(Exception e) {
			
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//문의 글 상세
	public InquiryVO getInquiry(int inqu_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InquiryVO inquiry = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "select * from inquiry b join member m using(mem_num) join member_detail d using(mem_num) where b.inqu_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, inqu_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				inquiry = new InquiryVO();
				
				inquiry.setInqu_num(rs.getInt("inqu_num"));
				inquiry.setMem_num(rs.getInt("mem_num"));
				inquiry.setInqu_cate(rs.getString("inqu_cate"));
				inquiry.setInqu_title(rs.getString("inqu_title"));
				inquiry.setInqu_content(rs.getString("inqu_content"));
				inquiry.setInqu_file(rs.getString("inqu_file"));
				inquiry.setInqu_hit(rs.getInt("inqu_hit"));
				inquiry.setInqu_check(rs.getInt("inqu_check"));
				inquiry.setInqu_reg_date(rs.getDate("inqu_reg_date"));
			}
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return inquiry;
	}
	
	//조회수 증가
	public void updateReadcount(int inqu_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "update inquiry set inqu_hit = inqu_hit + 1 where inqu_num = ?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터를 바인딩
			pstmt.setInt(1, inqu_num);
			
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//파일 삭제
	public void deleteFile(int inqu_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "update inquiry set inqu_file = '' where inqu_num = ?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터 바인딩
			pstmt.setInt(1, inqu_num);
			
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//문의 글 수정
	public void updateInquiry(InquiryVO inquiry) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sub_sql = "";
		String inqu_cate = null;
		int cnt = 0;
		
		try {			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			if((inquiry.getInqu_cate()).equals("1")) {
				inqu_cate = "예약문의";
			} else if((inquiry.getInqu_cate()).equals("2")){
				inqu_cate = "상품문의";
			} else if((inquiry.getInqu_cate()).equals("3")){
				inqu_cate = "주문/배송문의";
			} else {
				inqu_cate = "기타문의";
			}
			
			//전송된 파일 여부 체크
			if(inquiry.getInqu_file() != null) {
				sub_sql += ", inqu_file = ?";
			}

			sql = "update inquiry set inqu_cate = ?, inqu_title = ?, inqu_content = ?, inqu_check = ?" + sub_sql + " where inqu_num = ?"; 
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터 바인딩
			pstmt.setString(++cnt, inqu_cate);
			pstmt.setString(++cnt, inquiry.getInqu_title());
			pstmt.setString(++cnt, inquiry.getInqu_content());
			pstmt.setInt(++cnt, inquiry.getInqu_check());
			if(inquiry.getInqu_file() != null) {
				pstmt.setString(++cnt, inquiry.getInqu_file());
			}
			pstmt.setInt(++cnt, inquiry.getInqu_num());
			
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//문의 글 삭제
	public void deleteInquiry(int inqu_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			
			sql = "delete from inquiry where inqu_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqu_num);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}