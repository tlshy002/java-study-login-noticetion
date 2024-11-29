package image;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageCrud;

/**
 * Servlet implementation class ImageDeleteDoServlet
 */
@WebServlet("/imageDeleteDo.do")
public class ImageDeleteDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageDeleteDoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String w_id = request.getParameter("id");//이미지 게시글 번호 수신
		//입력한 암호와 DB에 있는 암호가 같은 비교한다.
		//1. 여기(ImageDeleteDo 서블릿)서 한다.		
		//2. JSP(ImageDeleteForm.jsp)에서 한다. ==> jsp에서 함
		System.out.println("ImageDeleteDo Servlet OK");
		ImageCrud dao = new ImageCrud();
		int result = dao.deleteImageBBS(Integer.parseInt(w_id));
		
		if(result > 0) {
			response.sendRedirect("index.jsp?BODY=imageDeleteResult.jsp?R=OK");
		} else {
			response.sendRedirect("index.jsp?BODY=imageDeleteResult.jsp?R=NOK");
			
		}
	}

}
















