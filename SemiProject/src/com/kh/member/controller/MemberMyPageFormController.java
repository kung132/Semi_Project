package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.hotel.model.service.HotelService;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Booking;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindId
 */
@WebServlet("/myPageForm.me")
public class MemberMyPageFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post -encoding
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		Member member = (Member)(request.getSession().getAttribute("loginMember"));
		int memberNo = member.getMemberNo();
		//int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(memberNo);
		
		// 페이징처리
		int listCount;
		int currentPage;
		int pageLimit;
		int hotelLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		// * listCount : 총 리스트 갯수
		listCount = new MemberService().selectBookCount(memberNo);
		
		// * currentPage : 현재페이지(== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 페이징바의 페이지 최대 갯수
		pageLimit = 10;
		
		// * hotelLimit : 한 페이지에 보여질 게시글의 최대 갯수(예약조회 갯수)
		hotelLimit = 10;
		
		// * maxPage : 가장 마지막 페이지가 몇번  페이지인지 (총 페이지 갯수)
		maxPage = (int)Math.ceil((double)listCount / hotelLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = ((currentPage-1) / pageLimit) * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 마지막 수
		endPage = startPage + pageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// page관련 객체 만들기
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, hotelLimit
				,maxPage, startPage, endPage);
		
		// 예약정보 가져와야
		ArrayList<Booking> list = new MemberService().selectListBooking(memberNo, pi);
		
		System.out.println("list : "+list);
		// 값 보내기
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
	
		request.getRequestDispatcher("views/member/reservationSelect.jsp").forward(request, response);;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
