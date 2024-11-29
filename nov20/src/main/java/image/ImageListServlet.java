package image;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageCrud;
import notice.FromTo;
import sangsoo.SangSoo;

/**
 * Servlet implementation class ImageListServlet
 */
@WebServlet("/imageList.do")
public class ImageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page_num = request.getParameter("PAGE_NUM");
		
		//페이지네이션을 위한 계산
		int currentPage = 1; //현재페이지
		if(page_num != null) currentPage = Integer.parseInt(page_num);
		int startRow = (currentPage - 1) * SangSoo.PAGE_NUM; 
		int endRow = ((currentPage - 1) * SangSoo.PAGE_NUM) + 6;
		
		FromTo ft = new FromTo();
		ft.setStart(startRow);
		ft.setEnd(endRow);
		ImageCrud dao = new ImageCrud();
		
		int totalCount = dao.getTotalImage(); //이미지 게시글의 전체 수
		int pageCount = 0; //페이지 수를 위한 변수 선언
		if(totalCount > 0) {
			pageCount = totalCount / SangSoo.PAGE_NUM; //한 페이지에 게시글 5개를 출력
			if(totalCount % SangSoo.PAGE_NUM > 0) pageCount++; //나머지가 존재하면 페이지수 1증가
		}
		
		
		ArrayList<ImageBBS> imageList = dao.getImageList(ft); //화면전환할때 JSP페이지로 객체(ArrayList)를 넘기려면 Forward 사용
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("LIST", imageList);
		request.setAttribute("TOTAL", totalCount);
		request.setAttribute("START", startRow + 1); //1페이지 쿼리에서 0번~6번으로 작성했지만 실제로는 1번~5번을 의미하기때문에 시작+1, 끝-1 했음
		
		if(endRow > totalCount) {
			endRow = totalCount + 1;
		}
		request.setAttribute("END", endRow - 1);
		
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=imageList.jsp");
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
