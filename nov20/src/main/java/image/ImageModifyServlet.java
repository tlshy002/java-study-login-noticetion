package image;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageCrud;

/**
 * Servlet implementation class ImageModifyServlet
 */
@WebServlet("/imageModify.do")
public class ImageModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String w_id = request.getParameter("id");
		ImageCrud dao = new ImageCrud();
		ImageBBS dto = dao.getImageDetail(Integer.parseInt(w_id));//글번호로 이미지게시글 검색
		request.setAttribute("IMAGE", dto);//검색된 이미지게시글을 저장한다.
		//imageUpdateForm.jsp로 화면을 전환한다.(forward)
		//클래스(객체)를 JSP로 전달하는 방법은 오직 Forward 만 가능한다.
		//즉, 내장객체(HttpServletRequest)에 저장하고 전달하는 방식(forward)
		RequestDispatcher r = 
				request.getRequestDispatcher("index.jsp?BODY=imageUpdateForm.jsp");
		r.forward(request, response);
	}

}
