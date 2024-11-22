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
		//페이지네이션을 위한 계산
		int currentPage = 1; //현재페이지
		int startRow = (currentPage - 1) * 5; 
		int endRow = ((currentPage - 1) * 5) + 6;
		
		FromTo ft = new FromTo();
		ft.setStart(startRow);
		ft.setEnd(endRow);
		ImageCrud dao = new ImageCrud();
		int totalCount = dao.getTotalImage();
		
		ArrayList<ImageBBS> imageList = dao.getImageList(ft); //화면전환할때 JSP페이지로 객체(ArrayList)를 넘기려면 Forward 사용
		request.setAttribute("LIST", imageList);
		request.setAttribute("TOTAL", totalCount);
		request.setAttribute("START", startRow + 1); //1페이지 쿼리에서 0번~6번으로 작성했지만 실제로는 1번~5번을 의미하기때문에 시작+1, 끝-1 했음
		request.setAttribute("END", endRow - 1);
		
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=imageList.jsp");
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
