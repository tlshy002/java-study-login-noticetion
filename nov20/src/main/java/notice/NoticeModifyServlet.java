package notice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Crud;

/**
 * Servlet implementation class NoticeModifyServlet
 */
@WebServlet("/noticeModify.do")
public class NoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR"); //한글처리
		String button = request.getParameter("BTN"); //버튼의 제목이 들어있는 파라미터 받기
		String num = request.getParameter("NO"); //공지글 번호가 들어있는 파라미터 받기
		
		if(button.equals("수정")) {
			
			Crud dao = new Crud(); //마이바티스용 DAO를 생성
			String title = request.getParameter("TITLE");
			String content = request.getParameter("CONTENT");
			
			NoticeDTO dto = new NoticeDTO();
			dto.setNum(Integer.parseInt(num));
			dto.setTitle(title); 
			dto.setContent(content);
			
			int result = dao.updateNotice(dto);//update 실행
			if(result > 0) response.sendRedirect("noticeList.do");//공지사항 목록 출력
			
		} else if(button.equals("삭제")) {
			
			// jdbc 방식으로 삭제 작업
			//NoticeDeletDAO dao = new NoticeDeletDAO();
			//boolean result = dao.doit(num);
			
			Crud dao = new Crud(); //마이바티스용 DAO를 생성
			int result = dao.deleteNotice(Integer.parseInt(num)); //공지글 삭제
			if(result > 0) { //공지글 삭제 성공
				response.sendRedirect("noticeList.do");
			} else { //공지글 삭제 실패 
				
			}
		}
	}

}

class NoticeDeletDAO {
	String query = "delete from notice_tbl where num = ?";
	Connection conn;
	PreparedStatement pstmt;
	boolean result;
	
	boolean doit(String num) {
		try {
			Class.forName(OracleXE11g.LIB);
			conn = DriverManager.getConnection(OracleXE11g.NAME, "hr","hr");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));//첫번째 물음표에 글번호를 정수로 넣는다.
			
			return result;
			
		} catch(Exception e) {
			System.out.println("공지글 삭제 작업 중 문제발생!");
		} finally {
			try { conn.close(); }catch(Exception e) {}
		}
		return result;
	}
}
