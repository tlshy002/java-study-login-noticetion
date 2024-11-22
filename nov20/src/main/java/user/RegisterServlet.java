package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Crud;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("ID");
		String name = request.getParameter("NAME");
		String address = request.getParameter("ADDR");
		String tel = request.getParameter("PHONE");
		String password = request.getParameter("PW");
		String gender = request.getParameter("GENDER");
		System.out.println("성별:"+gender);
		String email = request.getParameter("EMAIL");
		String birthday = request.getParameter("BIRTH");
		String job = request.getParameter("JOB");
		
		UserInfo userInfo = new UserInfo();//DTO를 생성한다.
		userInfo.setUser_id(id); userInfo.setUser_pw(password); userInfo.setName(name);
		userInfo.setAddr(address); userInfo.setPhone(tel); userInfo.setEmail(email);
		userInfo.setBirth(birthday); userInfo.setJob(job); userInfo.setGender(gender);
		userInfo.setGrade(0);//모든 가입자는 등급을 0으로 시작
		Crud dao = new Crud();//DAO를 생성
		int result = dao.insertUser(userInfo);//MyBatis로 insert를 처리
		if(result > 0) {//가입 성공!
			//userEntryResult.jsp로 페이지를 전환한다.(Redirect)
			response.sendRedirect("index.jsp?BODY=userEntryResult.jsp?R=YES");
		}else {//가입 실패!
			response.sendRedirect("index.jsp?BODY=userEntryResult.jsp?R=NO");
		}
	}

}
