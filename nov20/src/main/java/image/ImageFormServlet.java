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
 * Servlet implementation class ImageFormServlet
 */
@WebServlet("/imageForm.do")
public class ImageFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String w_id = request.getParameter("id");
		String parentId = request.getParameter("parentid");
		String groupId = request.getParameter("groupid");
		String title = "";
		
		ImageCrud dao = new ImageCrud();
		ImageBBS dto = dao.getImageDetail(Integer.parseInt(w_id)); //글번호로 원글을 검색
		dto.setParent_id(Integer.parseInt(groupId)); //부모글 번호를 설정
		title = "RE]" + dto.getTitle(); //답글의 제목만들기 예) RE]환영합니다.
		
		request.setAttribute("imageBBS", dto); //검색된 게시글을 저장
		request.setAttribute("title", title); //답글의 제목을 저장
		
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=imageWriteForm.jsp");
		r.forward(request, response);
		//dto를 보내야하기 때문에 포워드밖에 안됨
		
	}

}
