package Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_dao.BDao;
import board_dto.BDto;


public class BListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao dao = new BDao();
		ArrayList<BDto> dtos =dao.list();
		request.setAttribute("list", dtos);
	}
}

