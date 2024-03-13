package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DbConnect;

@WebServlet("/addSpecialist")
public class AddSpecialist  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			String spec_name = req.getParameter("specialistName");
			SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
			boolean f = dao.addSpecialist(spec_name);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("sucmsg", "Specialist Successfully added");
				resp.sendRedirect("admin/index.jsp");
			}else {
				session.setAttribute("errormsg", "Something went wrong on server");
				resp.sendRedirect("admin_login.jsp");
			}
	}

	
	

}
