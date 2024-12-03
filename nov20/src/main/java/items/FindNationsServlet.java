package items;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsCrud;

/**
 * Servlet implementation class FindNationsServlet
 */
@WebServlet("/findNation.do")
public class FindNationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindNationsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    //앵커에 의한 서블릿호출이므로 doGet()호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 원산지 테이블에서 국가코드와 국가이름을 검색하기
		// 검색된 국가코드와 국가이름을 jsp로 전달하기
		
		ItemsCrud dao = new ItemsCrud();//DAO생성
		ArrayList<MadeIn> list = (ArrayList<MadeIn>)dao.getNations();
		request.setAttribute("NATIONS", list);//조회결과를 HttpServletRequest에 저장
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=inputItems.jsp");
		r.forward(request, response);
		//inputItems.jsp로 화면을 전환한다.(Forward)
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
