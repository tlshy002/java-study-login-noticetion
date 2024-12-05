package items;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ItemsCrud;

/**
 * Servlet implementation class ItemDetailServlet
 */
@WebServlet("/itemDetail.do")
public class ItemDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("CODE");
		
		// 변수 code에 할당된 상품번호로 db 검색
		ItemsCrud dao = new ItemsCrud();
		Items dto = dao.getItem(code);
		request.setAttribute("ITEM", dto); //조회결과를 HttpServletRequest에 저장
		
		// 관리자로 로그인했는지 알기위해, 세션에서 계정찾기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("ID"); //loginServlet에서 찾음
		
		String url = "";
		if(userId != null && userId.equals("admin")) {
			// 관리자인 경우, itemDetailAdmin.jsp로 이동
			url = "itemDetailAdmin.jsp";
			ArrayList<MadeIn> nations = (ArrayList<MadeIn>)dao.getNations();
			request.setAttribute("NATIONS", nations);
		} else {
			url = "itemDetail.jsp";
		}
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY="+url);
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
