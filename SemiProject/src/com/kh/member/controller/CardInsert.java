package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.vo.Card;

/**
 * Servlet implementation class CardInsert
 */
@WebServlet("/cardInsert.me")
public class CardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String cardNo1 = request.getParameter("cardNo1");
		String cardNo2 = request.getParameter("cardNo2");
		String cardNo3 = request.getParameter("cardNo3");
		String cardNo4 = request.getParameter("cardNo4");
		
		String cardNo = cardNo1+cardNo2+cardNo3+cardNo4;
		
		String cardValidate = request.getParameter("cardValidate");
		int cardPwd = Integer.parseInt(request.getParameter("cardPwd"));
		int cvc = Integer.parseInt(request.getParameter("cvc"));
		
		Member member = (Member)(request.getSession().getAttribute("loginMember"));
		
		Card c = new Card();
		c.setCardNo(cardNo);
		c.setCardValidate(cardValidate);
		c.setCardPwd(cardPwd);
		c.setCvc(cvc);
		c.setMemberNo(member.getMemberNo());
		
		int result = new MemberService().insertCard(c);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "카드등록에 성공했습니다");
			response.sendRedirect(request.getContextPath()+"/cardRegister.me");
		}
		else {
			request.getSession().setAttribute("alertMsg", "카드등록에 실패했습니다");
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
