package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Crud;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String pw = request.getParameter("PW");
		
		//jdbc
		//LoginCheckDAO dao = new LoginCheckDAO();
		//boolean yesOrNo = dao.doit(id, pw);
		
		//팝업창을 통한 로그인인지 구분하기
		String popup = request.getParameter("POPUP");
		
		Crud dao = new Crud();
		LoginDTO dto = new LoginDTO();
		dto.setId(id);
		dto.setPassword(pw);
		String yesOrNo = dao.getIdByLogin(dto);
		
		if(yesOrNo != null) {
			//로그인 성공했으므로 HttpSession에 데이터(보통 계정정보)를 저장한다.
			HttpSession session = request.getSession();
			session.setAttribute("ID", id);
			
			if(popup != null) { //팝업창을 통한 로그인
				response.sendRedirect("loginSuccess.jsp");
			} else { //index.jsp를 통한 로그인
				response.sendRedirect("index.jsp?BODY=loginSuccess.jsp");
			}
		} else { //로그인 실패한경우
			if(popup != null) {
				response.sendRedirect("index.jsp?MSG=Y");
			} else {
				response.sendRedirect("index.jsp?BODY=login.jsp?MSG=f");
			}
		}
	}

}
