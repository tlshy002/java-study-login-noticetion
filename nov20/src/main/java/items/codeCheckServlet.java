package items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsCrud;

/**
 * Servlet implementation class codeCheckServlet
 */
@WebServlet("/codeCheck.do")
public class codeCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public codeCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("CODE");
		//response.sendRedirect("codeCheckResult.jsp"); //팝업창이 뜨는지 검사
		
		//상품정보테이블에서 code의 상품코드 검색하기
		ItemsCrud dao = new ItemsCrud(); //DAO생성
		String result = dao.getCode(code);
		request.setAttribute("CODE", code); //입력한 상품코드 저장
		request.setAttribute("DUP", result); //중복검사 결과 저장
		
		//중복검사 결과가 존재하면 '이미사용중', 검색결과가 없으면 '사용가능'
		RequestDispatcher r = request.getRequestDispatcher("codeCheckResult.jsp");
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
