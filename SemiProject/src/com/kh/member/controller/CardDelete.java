package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CardDelete
 */
@WebServlet("/cardDelete.me")
public class CardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		Member member = (Member)(request.getSession().getAttribute("loginMember"));

		int result = new MemberService().deleteCard(member);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "카드삭제에 성공했습니다");
			response.sendRedirect(request.getContextPath()+"/cardRegister.me");
		}
		else {
			request.getSession().setAttribute("alertMsg", "카드삭제에 실패했습니다");
			response.sendRedirect(request.getContextPath()+"/cardRegister.me");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
