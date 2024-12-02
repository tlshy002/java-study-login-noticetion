package image;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ImageCrud;

/**
 * Servlet implementation class ImageWriteServlet
 */
@WebServlet("/imageWrite.do")
public class ImageWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String uploadPath = "/upload"; //업로드될 파일이 저장될 폴더 이름 선언
		int maxLimit = 5 * 1024 * 1024; //업로드 파일의 최대 크기 설정(5MB)
		String encType = "euc-kr"; //사용하는 언어코드 설정
		
		ServletContext ctx = this.getServletContext(); // 헤당 서블릿이 동작할때 서블릿의 환경, 초기화 파라미터를 어떤걸 쓰는 등 정보를 갖고 있는 클래스
		String realPath = ctx.getRealPath(uploadPath); // upload 폴더의 절대경로 찾기위해서 ServletContext의 인스턴스가 필요함
		String fileName = ""; //파일 업로드가 성공하면 파일이름을 저장할 변수 선언
		
		System.out.println("파일이 저장된 폴더: "+realPath);
		String result = "NOK"; //업로드 결과를 저장할 변수선언 (성공이면 OK, 실패면 NOK)
		
		try { 
			//파일을 업로드 할 때 사용하는 클래스(MultipartRequest)의 인스턴스를 생성
			MultipartRequest multipart = new MultipartRequest(request, realPath,
					maxLimit, encType, new DefaultFileRenamePolicy());
			// DefaultFileRenamePolicy클래스의 역할: 동일한 이름의 파일이 업로드된 경우 이름에 숫자를 붙임
			
			fileName = multipart.getFilesystemName("IMAGENAME"); //파일 업로드를 실행. input태그의 file타입의 name 파라미터를 할당
			if(fileName == null) {
				System.out.println("업로드 실패");
			} else  {
				// JSP(폼)에 있는 파라미터 값을 서블릿으로 불러오는 법
				// 지금까지는 HttpServletRequest클래스 request 객체의 getParameter()메서드를 사용했었는데,
				// 이번에는 MultipartRequest클래스의 getParameter() 메서드를 사용함
				String orderNo = multipart.getParameter("orderno");
				String groupId = multipart.getParameter("groupid");
				String parentId = multipart.getParameter("parentid");
				
				String title = multipart.getParameter("TITLE");
				String password = multipart.getParameter("PW");
				String content = multipart.getParameter("CONTENT");
				
				ImageBBS dto = new ImageBBS();//DTO 생성
				ImageCrud dao = new ImageCrud();//DAO 생성
				int number = dao.getMaxNum() + 1;//글번호 생성
				dto.setW_id(number); 
				dto.setTitle(title); 
				dto.setPassword(password);
				dto.setContent(content); dto.setImagename(fileName);
				
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("ID");//세션에서 계정을 찾는다.
				dto.setWriter(id);
				
				if(parentId == null || parentId.equals("")) {//parentId가 없으므로 원글
					dto.setGroup_id(number);//그룹번호가 글번호와 같다.
					dto.setParent_id(0);
					dto.setOrder_no(0);
				}else {//parentId가 있으므로 답글
					dto.setParent_id(Integer.parseInt(parentId));
					dto.setGroup_id(Integer.parseInt(groupId));
					dto.setOrder_no(Integer.parseInt(orderNo));
					//DB에서 답글 순서번호(order_no)를 update한다.
				}
				
				int yesOrNo = dao.insertImageBBS(dto);//이미지게시글 테이블에 insert 실행
				
				if(yesOrNo > 0) {//이미지 게시글 등록 성공한 경우
					System.out.println("이미지 게시글 등록 성공");
				}else {//이미지 게시글 등록 실패한 경우
					System.out.println("이미지 게시글 등록 실패");
				}
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		//파일을 업로드하고 게시글을 DB에 저장한 후 uploadResult.jsp로 전환 (Redirect? Forward? ==> Redirect)
		//response.sendRedirect("index.jsp?BODY=uploadResult.jsp?R=" + result);
	}

}
