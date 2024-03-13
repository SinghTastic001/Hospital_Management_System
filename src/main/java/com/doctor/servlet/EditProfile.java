package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DbConnect;
import com.entity.Doctor;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String mobNo = req.getParameter("mobno");
			int id = Integer.parseInt(req.getParameter("id"));

			Doctor d = new Doctor(id,fullName, dob, qualification, specialist, email, mobNo,"");
			DoctorDao dao = new DoctorDao(DbConnect.getConn());
			HttpSession session = req.getSession();
			if (dao.editDoctorProfile(d)) {
				Doctor	updateDoctor = dao.getDoctorById(id);
				session.setAttribute("sucmsgd", "Doctor update successfully...");
				session.setAttribute("doctorobj", updateDoctor);
				resp.sendRedirect("doctor/edit_dprofile.jsp");
			} else {
				session.setAttribute("errormsgd", "something went wrong on server");
				resp.sendRedirect("doctor/edit_dprofile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
