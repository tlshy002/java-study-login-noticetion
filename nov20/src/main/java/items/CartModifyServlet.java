package items;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartModifyServlet
 */
@WebServlet("/cartModify.do")
public class CartModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String code = request.getParameter("CODE");
		String button = request.getParameter("BTN");
		
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("CART");// Cart를 세션에서 찾기
		
		if(button.equals("삭제")) {
			cart.deleteItem(code); //장바구니클래스의 deleteItem()메서드를 사용하여 Cart에서 삭제
		} else if(button.equals("수정")) {
			
		}
		response.sendRedirect("cartList.do"); //장바구니 목록으로 다시이동
	}

}
