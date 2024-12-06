package items;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addCartServlet
 */
@WebServlet("/addCart.do")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 검사를 해서 로그인 안한 경우에 login.jsp를 보여준다.
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("ID"); //세션에서 계정찾기
		String url = "";
		
		if(id == null) { //계정이 없는 경우, 즉, 로그인을 안 한 경우
			url = "login.jsp?MSG=Y";
		} else { //계정이 있는 경우, 즉, 로그인을 한 경우
			String code = request.getParameter("CODE"); //상품번호 수신
			
			Cart cart = (Cart)session.getAttribute("CART"); //세션에서 장바구니 찾기
			if(cart == null) { //세션에 장바구니가 없을때만 Cart를 새로 생성
				cart = new Cart(id); //로그인한 계정으로 장바구니 생성			
			}
			cart.addCart(code,1); //상품번화와 상품개수(1개)저장
			session.setAttribute("CART", cart); //장바구니를 세션에 저장
			url = "addCartResult.jsp";
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
