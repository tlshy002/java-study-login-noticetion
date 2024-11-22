package image;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageDeleteServlet
 */
@WebServlet("/imageDelete.do")
public class ImageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	// 앵커에 의한 서블릿 호출이 아닌, 자바스크립트를 통해 post 메서드로 전송했기 때문에 doPost()호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); //글번호
		System.out.println("글번호: "+id);
	}

}
