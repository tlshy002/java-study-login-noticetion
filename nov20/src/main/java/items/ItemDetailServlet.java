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
		
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=itemDetail.jsp");
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
