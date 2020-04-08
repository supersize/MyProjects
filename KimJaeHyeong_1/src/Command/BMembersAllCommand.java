package Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Dto;



public class BMembersAllCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		ArrayList<Dto> dtos =dao.membersAll();
		request.setAttribute("membersAll", dtos);
	}
}

