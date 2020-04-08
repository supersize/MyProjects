package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Dto;
import board_dao.BDao;


public class BWriteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Dto dtoMember = new Dto();
		HttpSession session = request.getSession(true);
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		String bTitle = request.getParameter("title");
		String bContent = request.getParameter("content");
		
		BDao dao = new BDao();
		dao.write(id, bTitle, bContent);
	}
}
