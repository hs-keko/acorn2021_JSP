package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
   private static MemberDao dao;
   //외부에서 객체 생성하지 못하도록
   private MemberDao() {}
   //자신의 참조값을 리턴해주는 공개 메소드
   public static MemberDao getInstance() {
      if(dao==null) {
         dao=new MemberDao();
      }
      return dao;
   }
   // 회원 한명의 정보를 수정하는 메소드
   public boolean update(MemberDto dto) {
	   	Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "UPDATE member"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			// insert of update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
   }
   
   // 회원 한명의 정보를 리턴하는 메소드
   public MemberDto getData(int num) {
	   // 리턴해줄 객체의 참조값을 담을 지역변수 만들기
	   	MemberDto dto=null;
	   	Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성
			String sql = "SELECT name, addr"
					+ " FROM member"
					+ " WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
			//select 문 수행하고 결과를 ResultSet 으로 받아오기
			rs = pstmt.executeQuery();
			//만일 select 된 row 가 있다면  ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
			if(rs.next()) { // 의미상 for 문보다는 if 문이 자연스러움
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
   }
   
   // 회원 목록을 삭제하는 메소드
   public boolean delete(int num) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   int flag = 0;
	   try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "DELETE FROM member"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
			// insert of update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
			flag = pstmt.executeUpdate();
	   } catch (Exception e) {
		   e.printStackTrace();
	   } finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
   }
   
   // 회원 정보를 DB에 저장하는 메소드
   public boolean insert(MemberDto dto) {
	   Connection conn = null;
	PreparedStatement pstmt = null;
	int flag = 0;
	try {
		conn = new DbcpBean().getConn();
		// 실행할 sql 문 작성
		String sql = "INSERT INTO member"
				+ " (num, name, addr)"
				+ " VALUES(member_seq.NEXTVAL, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		// ? 에 바인딩할 내용이 있으면 여기서 바인딩
		// 1 번째 ? 에 dto 에 있는 회원의 이름을 읽어와서 바인딩
		pstmt.setString(1, dto.getName());
		// 2 번째 ? 에 dto 에 있는 회원의 이름을 읽어와서 바인딩
		pstmt.setString(2, dto.getAddr());		
		// insert of update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
		flag = pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
	if (flag > 0) {
		return true;
	} else {
		return false;
	}
   }
   

   
   //회원 목록을 리턴하는 메소드
   public List<MemberDto> getList(){
	   
	   	// 회원 목록을 담을 객체 생성
	   	List<MemberDto> list=new ArrayList<>();
	   	
	    Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성
			String sql = "SELECT num, name, addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩

			//select 문 수행하고 결과를 ResultSet 으로 받아오기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
			while (rs.next()) {
				MemberDto dto=new MemberDto();
				// 현재 커서가 위치한 곳의 num 칼럼, name 칼럼, addr 칼럼에 있는 데이터를 읽어와서 담기
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				// 회원 한명의 정보가 담긴 MemberDto 객체의 참조값을 List 에 누적 시키기
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); // close() 하면 자동으로 Connection Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
	// 회원 목록 리턴해주기
      return list;
   }
   
   //원하는 페이지의 회원 목록을 리턴하는 메소드
   public List<MemberDto> getList(MemberDto dto){
      //회원목록을 담을 객체 생성
      List<MemberDto> list=new ArrayList<>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "SELECT *" + 
               " FROM" + 
               "   (SELECT result1.*, ROWNUM AS rnum" + 
               "   FROM" + 
               "      (SELECT num,name,addr" + 
               "      FROM member" + 
               "      ORDER BY num DESC) result1)" + 
               " WHERE rnum >= ? AND rnum <= ?";
         //PreparedStatement 객체의 참조값 얻어오기
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩
         pstmt.setInt(1, dto.getStartRowNum());
         pstmt.setInt(2, dto.getEndRowNum());
         //select 문 수행하고 결과를 ResultSet 으로 받아오기
         rs = pstmt.executeQuery();
         //반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
         while (rs.next()) {
            //MemberDto 객체를 생성해서 
            MemberDto tmp=new MemberDto();
            //현재 커서가 위치한 곳의  num 칼럼, name 칼럼, addr 칼럼에 있는 데이터를 읽어와서 담기
            tmp.setNum(rs.getInt("num"));
            tmp.setName(rs.getString("name"));
            tmp.setAddr(rs.getString("addr"));
            //회원 한명의 정보가 담긴 MemberDto 객체의 참조값을 List 에 누적 시키기
            list.add(tmp);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close(); // close() 하면 자동으로 Connection Pool 에 반납된다.
         } catch (Exception e) {
         }
      }
      //회원 목록 리턴해주기 
      return list;
   }
   
   //전체 로우의 갯수를 리턴해주는 메소드
   public int getCount() {
	   // 전체 row 의 갯수를 담을 지역변수 만들기
	   int count=0;
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   try {
		//Connection 객체의 참조값 얻어오기 
		conn = new DbcpBean().getConn();
		//실행할 sql 문 작성
		String sql = "SELECT MAX(ROWNUM) AS num FROM member";
		//PreparedStatement 객체의 참조값 얻어오기
		pstmt = conn.prepareStatement(sql);
		//? 에 바인딩할 내용이 있으면 여기서 바인딩

		//select 문 수행하고 결과를 ResultSet 으로 받아오기
		rs = pstmt.executeQuery();
		//만일 결과가 있다면 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
		if (rs.next()) {
			count = rs.getInt("num");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
	   return count;
   }
}