package notice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Crud;
import sangsoo.SangSoo;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/noticeList.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeListServlet() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 앵커 링크를 통해 서블릿을 호출했기 때문에 doGet콜백메서드 호출
		
		// 페이지 처리에 사용하는 파라미터 받기
		String page_num = request.getParameter("PAGE_NUM");
		
		int currentPageNum = 1;
		if(page_num != null) { //PAGE_NUM 값이 존재하는 경우, 페이네이션의 페이지를 누른경우
			currentPageNum = Integer.parseInt(page_num);
		} else { // PAGE_NUM값이 없는 경우, 공지사항 보기 버튼을 누른 경우			
		}
		int startRow = (currentPageNum - 1) * SangSoo.PAGE_NUM; //시작 일련번호
		int endRow = ((currentPageNum - 1) * SangSoo.PAGE_NUM) + 6; //종료 일련번호
		
		// jdbc
		//NoticeListDAO dao = new NoticeListDAO();
		//ArrayList<NoticeDTO> list = dao.doit(startRow, endRow);//공지사항 글 목록을 검색한다.(글번호를 기준으로 내림차순 정렬)
		
		// mybatis
		FromTo ft = new FromTo();
		ft.setStart(startRow);
		ft.setEnd(endRow);
		Crud dao = new Crud();
		ArrayList<NoticeDTO> list = dao.getNoticeList(ft);
		
		//페이지 수를 찾는 작업 jdbc
//		NoticeCountDAO countDao = new NoticeCountDAO();
//		int total = countDao.doit();
//		int pageCount = total / 5;
//		if(total % 5 != 0) pageCount++;
		
		// mybatis
		Crud countDao = new Crud();
		int total = countDao.getNoticeCount();
		int pageCount = total / SangSoo.PAGE_NUM;
		if(total % SangSoo.PAGE_NUM != 0) pageCount++;
		
		
		request.setAttribute("NOTICES", list);
		request.setAttribute("PAGES", pageCount);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?BODY=noticeList.jsp");
		rd.forward(request, response);
	}
}

class NoticeCountDAO {
	String query = "select count(*) from notice_tbl";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	int totalCount;
	
	int doit() {
		try {
			Class.forName(OracleXE11g.LIB);
			conn = DriverManager.getConnection(OracleXE11g.NAME, "hr", "hr");
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt(1); //조회결과를 변수에 저장
			}			
		} catch(Exception e) {
			System.out.println("전체 공지글 개수 찾는 작업 중 문제발생!");
		} finally {
			try { conn.close(); }catch(Exception e) {}
		}
		return totalCount;
	}
}

class NoticeListDAO {
	String query = "select num, title, writer, w_date "
			+ "from(select rownum as rank, num, title, writer, "
			+ "to_char(write_date, 'YYYY/MM/DD HH24:Mi:SS') w_date "
			+ "from notice_tbl order by num desc) "
			+ "where rank > ? and rank < ?";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<NoticeDTO> list;
	
	ArrayList<NoticeDTO> doit(int start, int end) {
		try {
			Class.forName(OracleXE11g.LIB);
			conn = DriverManager.getConnection(OracleXE11g.NAME, "hr", "hr");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			list = new ArrayList<NoticeDTO>();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNum(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setWriter(rs.getString(3));
				dto.setNotice_date(rs.getString(4));
				list.add(dto); //조회결과가 저장된 DTO를 ArrayList에 저장
			}
			
		} catch(Exception e) {
			System.out.println("공지사항 목록 검색 중 문제발생!");
		} finally {
			try { conn.close(); }catch(Exception e) {}
		}
		return list;
	}
	
	
}