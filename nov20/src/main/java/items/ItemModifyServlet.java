package items;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsCrud;

/**
 * Servlet implementation class ItemModifyServlet
 */
@WebServlet("/itemModify.do")
public class ItemModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String button = request.getParameter("BTN"); //jsp로부터 버튼제목 수신
		String code = request.getParameter("CODE"); //jsp로부터 상품번호 수신
		ItemsCrud dao = new ItemsCrud(); //DAO생성
		
		if(button.equals("삭제")) { //삭제버튼 누른경우 (삭제는 dto 필요없음)
			int result = dao.deleteItem(code);
			String url = "index.jsp?BODY=itemDeleteResult.jsp?R=";
			if(result > 0) { //삭제가 성공한 경우
				url += "OK";
			} else {
				url += "NOK";
			}
			response.sendRedirect(url); //삭제결과 jsp로 화면전환
			
		} else if(button.equals("수정")) { //수정버튼 누른경우
			String name = request.getParameter("NAME");
			String nation = request.getParameter("NATION");
			String spec = request.getParameter("SPEC");
			String price = request.getParameter("PRICE");
			
			// db에 update 수행하기 (dto, dao, mapper(쿼리문작성))
			Items dto = new Items(); //상품정보용 DTO생성
			dto.setItem_title(name);
			dto.setItem_code(code);
			dto.setNation(nation);
			dto.setItem_spec(spec);
			dto.setPrice(Integer.parseInt(price));
			
			int result = dao.updateItem(dto);
			String url = "index.jsp?BODY=itemUpdateResult.jsp?R=";
			if(result > 0) url += "OK";
			else url += "NOK";
			response.sendRedirect(url);
			
		}
	}

}
