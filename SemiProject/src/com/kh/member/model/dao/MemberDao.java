package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Booking;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.vo.Card;

public class MemberDao {
	
private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * @param conn
	 * @param memberId
	 * @param memberPwd
	 * @param  
	 * @return
	 */
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
			
			Member m = null;
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("loginMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					m = new Member(rset.getInt("MEMBER_NO")
								 , rset.getString("MEMBER_NAME")
								 , rset.getString("MEMBER_ID")
								 , rset.getString("MEMBER_PWD")
								 , rset.getString("GENDER")
								 , rset.getString("EMAIL")
								 , rset.getString("PHONE")
								 , rset.getString("BIRTH")
								 , rset.getDate("ENROLL_DATE")
								 , rset.getDate("MODIFY_DATE")
								 , rset.getString("STATUS"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
	
				close(rset);
				close(pstmt);
			}
			
			// Service 에 결과 (Member) 넘기기
			return m;
	}
	
	/**
	 * @param conn
	 * @param checkId : 사용자가 입력한 ID 값
	 * @return : 입력 ID와 DB ID를 비교하여, 중복되면 1 / 중복되지 않으면 0
	 */
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	/**
	 * @param conn
	 * @param checkEmail : 사용자가 입력한 email 값
	 * @return : 입력 email과 DB email을 비교하여, 중복되면 1 / 중복되지 않으면 0
	 */
	public int emailCheck(Connection conn, String checkEmail) {
	
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	public int insertMember(Connection conn, Member m) {
		
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3, m.getMemberPwd());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * @param conn
	 * @param memberName
	 * @param email
	 * @param phone
	 * @return
	 */
	public Member findId(Connection conn, String memberName, String email, String phone) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findId");
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				   m = new Member(rset.getInt("MEMBER_NO")
								, rset.getString("MEMBER_NAME")
								, rset.getString("MEMBER_ID")
								, rset.getString("MEMBER_PWD")
								, rset.getString("GENDER")
								, rset.getString("EMAIL")
								, rset.getString("PHONE")
								, rset.getString("BIRTH")
								, rset.getDate("ENROLL_DATE")
								, rset.getDate("MODIFY_DATE")
								, rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
		
	}


	/**
	 * @param conn
	 * @param memberId
	 * @param memberName
	 * @param email
	 * @return
	 */
	public Member findPwd(Connection conn, String memberId, String memberName, String email) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findPwd");
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberName);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				   m = new Member(rset.getInt("MEMBER_NO")
								, rset.getString("MEMBER_NAME")
								, rset.getString("MEMBER_ID")
								, rset.getString("MEMBER_PWD")
								, rset.getString("GENDER")
								, rset.getString("EMAIL")
								, rset.getString("PHONE")
								, rset.getString("BIRTH")
								, rset.getDate("ENROLL_DATE")
								, rset.getDate("MODIFY_DATE")
								, rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
		
	}
	
	
	
	// ---------------------------마이페이지--------------------------------------
	public ArrayList<Booking> selectListBooking(Connection conn, int memberNo, PageInfo pi) {
		
		// select - ResultSet - ArrayList<Booking>
		ArrayList<Booking> list = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListBooking");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
			
			//int endRow = startRow + pi.getHotelLimit() -1;
			int endRow = startRow + pi.getHotelLimit() -1;
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Booking(rset.getInt("BOOK_NO")
									,rset.getString("BOOK_DATE")
									,rset.getString("PAY_STATUS")
						            ,rset.getString("MEMBER_NAME")
						            ,rset.getString("HOTEL_NAME")
						            ,rset.getInt("TOTAL_PAY")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Booking> selectSearchBookNo(Connection conn, int memberNo, int bookNo) {
		
		// select - ResultSet - ArrayList<Booking>
		ArrayList<Booking> list = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListBookNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, bookNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Booking(rset.getInt("BOOK_NO")
						            ,rset.getString("BOOK_DATE")
						            ,rset.getString("PAY_STATUS")
						            ,rset.getString("MEMBER_NAME")
						            ,rset.getString("HOTEL_NAME")
						            ,rset.getInt("ROOM_PRICE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Member loadMemberInfo(Connection conn, int memberNo) {
		
		// select -> ResultSet -> Member 
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loadMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEMBER_NO")
						      ,rset.getString("MEMBER_NAME")
						      ,rset.getString("MEMBER_ID")
						      ,rset.getString("MEMBER_PWD")
						      ,rset.getString("GENDER")
						      ,rset.getString("EMAIL")
						      ,rset.getString("PHONE")
						      ,rset.getString("BIRTH")
						      ,rset.getDate("ENROLL_DATE")
						      ,rset.getDate("MODIFY_DATE")
						      ,rset.getString("STATUS"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}

	public int reservationCancel(Connection conn, int bookNo, int memberNo) {
		
		// 삭제지만 update - result
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("reservationCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// ----------------------- 영훈님 꺼 ------------------------------------------
	public int updatePwdMember(Connection conn, String userId, String userPwd, String updatePwd) {
		
		// UPDATE 문 => 처리된 행의 갯수
		// 필요한 변수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		
		// SELECT 문 => ResultSet 형태로 결과 반환 => Member
		// 필요한 변수
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEMBER_NO"), 
							   rset.getString("MEMBER_NAME"), 
							   rset.getString("MEMBER_ID"), 
							   rset.getString("MEMBER_PWD"), 
							   rset.getString("GENDER"), 
							   rset.getString("EMAIL"), 
							   rset.getString("PHONE"), 
							   rset.getString("BIRTH"), 
							   rset.getDate("ENROLL_DATE"), 
							   rset.getDate("MODIFY_DATE"), 
							   rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}

		return m;
	}
	
	public int updateMember(Connection conn, Member m, String birth) {
		
		// UPDATE 문 => 처리된 행의 갯수
		
		// 필요한 변수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		System.out.println("daoPhone : "+m.getPhone());
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, birth);
			pstmt.setString(4, m.getGender());
			pstmt.setInt(5, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember2(Connection conn, String userName) {
		
		// SELECT 문 => ResultSet 형태로 결과 반환 => Member
		// 필요한 변수
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEMBER_NO"), 
							   rset.getString("MEMBER_NAME"), 
							   rset.getString("MEMBER_ID"), 
							   rset.getString("MEMBER_PWD"), 
							   rset.getString("GENDER"), 
							   rset.getString("EMAIL"), 
							   rset.getString("PHONE"), 
							   rset.getString("BIRTH"), 
							   rset.getDate("ENROLL_DATE"), 
							   rset.getDate("MODIFY_DATE"), 
							   rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return m;
	}
	// --------------------------영훈님꺼------------------------------------------
	// -------------------------마이페이지-------------------------------------------

	// 예약조회에서 예약전체를 카운트를 가져오는 메서드
	public int selectBookCount(Connection conn, int memberNo) {
		
		// select - ResultSet - but, int형으로 반환
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBookCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	// 로그인한 유저 카드 조회
	public Card selectCard(Connection conn, Member member) {
		
		// select -> ResulstSet
		Card card = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, member.getMemberNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				card = new Card(rset.getString("CARD_NO")
						       ,rset.getString("CARD_VALIDATE")
						       ,rset.getInt("CARD_PASSWORD")
						       ,rset.getInt("CVC")
						       ,rset.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return card;
	}

	// 카드등록 변경
	public int updateCard(Connection conn, Card c) {
		
		// update -> int
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getCardNo());
			pstmt.setString(2, c.getCardValidate());
			pstmt.setInt(3, c.getCardPwd());
			pstmt.setInt(4, c.getCvc());
			pstmt.setInt(5, c.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	// 카드 없는 회원 카드 등록 메서드
	public int insertCard(Connection conn, Card c) {
		
		// insert - int
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getCardNo());
			pstmt.setString(2, c.getCardValidate());
			pstmt.setInt(3, c.getCardPwd());
			pstmt.setInt(4, c.getCvc());
			pstmt.setInt(5, c.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 카드 삭제하는 구문 (status를)
	public int deleteCard(Connection conn, Member member) {
		
		// update - int
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, member.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
