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
 * Servlet implementation class CartListServlet
 */
@WebServlet("/cartList.do")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); //장바구니가 세션에 있기때문에 세션객체 생성
		Cart cart = (Cart)session.getAttribute("CART"); //세션에서 장바구니 찾기
		
		if(cart == null) {
			request.setAttribute("CARTLIST", null); //HttpServletRequest에 null 저장
		} else { //장바구니가 있는경우
			ArrayList<String> codeList = cart.getCodeList(); //해당 장바구니에서 상품번호가 저장된 ArrayList 찾기
			ArrayList<Integer> numList = cart.getNumList(); //해당 장바구니에서 상품개수가 저장된 ArrayList 찾기
			
			int total = 0; //장바구니에 저장된 상품의 총액계산을 위한 변수 선언
			ItemsCrud dao = new ItemsCrud(); //DAO 생성 ---> 왜?상품번호로 DB에서 상품정보를 찾아야하기때문 
			ArrayList<Items> itemsList = new ArrayList<Items>(); //장바구니 상품을 위한 ArrayList
			
			for(int i=0; i<codeList.size(); i++) {
				String code = codeList.get(i); //i 번째 상품의 번호를 찾기
				Items myItem = dao.getItem(code); //상품번호로 상품정보 찾기
				
				Integer num = numList.get(i); //i 번째 상품 개수 찾기				
				myItem.setNum(num); //상품개수를 DTO에 저장
				
				int sum = num * myItem.getPrice(); // 개수 * 가격 ---> 소계를 계산함
				myItem.setSum(sum); //소계를 DTO에 저장
				
				total += sum; //상품가격 누적 ---> 총계를 계산함
				itemsList.add(myItem);
			} //for문: 장바구니에 담긴 모든 상품을 차례로 반복
			
			request.setAttribute("TOTAL", total); //총계를 HttpServletRequest에 저장
			request.setAttribute("CARTLIST", itemsList); //장바구니의 상품목록 저장
		}
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=cartList.jsp");
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
