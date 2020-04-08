package fontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Command.BCommand;
import Command.BContentCommand;
import Command.BDeleteCommand;
import Command.BListCommand;
import Command.BMembersAllCommand;
import Command.BModifyCommand;
import Command.BModifyViewCommand;
import Command.BReplyCommand;
import Command.BReplyViewCommand;
import Command.BWriteCommand;

/**
 * Servlet implementation class BFrontController
 */
@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BFrontController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");

		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null; 

		BCommand command = null; 
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/write_view.do")){ 
			viewPage = "write.jsp";
		}else if(com.equals("/write.do")){	
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/list.do")){	
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "board.jsp";
		}else if(com.equals("/content_view.do")){	
			command = new BContentCommand();
			command.execute(request, response);
			viewPage = "content_view.jsp";
		}else if(com.equals("/modify.do")){	
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/delete.do")){
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/reply_view.do")){
			command = new BReplyViewCommand();
			command.execute(request, response);
			viewPage = "reply_view.jsp";
		}else if(com.equals("/reply.do")){	
			command = new BReplyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/update_view.do")){	
			command = new BModifyViewCommand();
			command.execute(request, response);
			viewPage = "modify_view.jsp";
		}else if(com.equals("/membersAll.do")){	
			command = new BMembersAllCommand();
			command.execute(request, response);
			viewPage = "membersAll.jsp";
		}else if(com.equals("/notification.do")){	
			viewPage = "notification_page.jsp";
		}else if(com.equals("/reply_write.do")){
			command = new BReplyViewCommand();
			command.execute(request, response);
			viewPage = "reply_write.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
