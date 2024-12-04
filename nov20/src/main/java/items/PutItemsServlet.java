package items;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsCrud;

/**
 * Servlet implementation class PutItemsServlet
 */
@WebServlet("/putItems.do")
public class PutItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PutItemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상품정보를 DTO에 넣고 DTO를 DAO의 메서드로 전달해서 상품정보 삽입하기
		//삽입결과를 jsp 로 화면전환
		
		String code = request.getParameter("CODE");
		String name = request.getParameter("NAME");
		String price = request.getParameter("PRICE");
		String nation = request.getParameter("NATION");
		String spec = request.getParameter("SPEC");
		
		Items dto = new Items(); //상품정보 DTO
		dto.setItem_code(code);
		dto.setItem_title(name);
		dto.setPrice(Integer.parseInt(price));
		dto.setNation(nation);
		dto.setItem_spec(spec); //jsp 입력폼에서 받은 상품정보를 DTO에 넣기
		
		ItemsCrud dao = new ItemsCrud();
		int result = dao.putItem(dto); //DTO를 DAO의 메서드로 전달해서 상품정보 삽입
		
		String url = "index.jsp?BODY=putItemsResult.jsp?R=";
		if(result > 0) url += "OK";
		else url += "NOK";
		
		//삽입결과를 jsp로 화면전환하기 (Redirect, 포워드로 전환하는경우 새로고침하면 db에 또 들어가서 포워드는 안됨)
		response.sendRedirect(url);		
	}

}
