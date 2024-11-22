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
 * Servlet implementation class ImageDetailServlet
 */
@WebServlet("/imageDetail.do")
public class ImageDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID"); //이미지 게시글의 번호 수신
		ImageCrud dao = new ImageCrud();
		ImageBBS dto = dao.getImageDetail(Integer.parseInt(id));
		
		request.setAttribute("DETAIL", dto);
		RequestDispatcher r = request.getRequestDispatcher("index.jsp?BODY=imageDetail.jsp");
		r.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
