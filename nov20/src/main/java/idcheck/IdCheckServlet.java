package idcheck;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Crud;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idCheck.do")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		Crud crud = new Crud();
		
		// exist 에 계정이 있으면 이미 사용중(중복), null 이면 사용가능 id
		String exist = crud.getIdCheck(id);
		
		request.setAttribute("ID", id); // 사용자가 입력한 계정을 저장
		request.setAttribute("DUP", exist); //중복 검사 결과를 저장
		
		//idCheckResult.jsp로 페이지를 전환한다.(Forward)
		RequestDispatcher rd = request.getRequestDispatcher("idCheckResult.jsp");
		rd.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
