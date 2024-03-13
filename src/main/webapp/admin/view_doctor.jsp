<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row"> 
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty errormsg}">
							<p class="fs-3 text-center text-danger">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucmsg}">
							<div class="fs-3 text-center text-success" role="alert">${sucmsg}</div>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
								List<Doctor> list1 = dao2.getAllDoctor();
								for(Doctor d:list1)
								{%>
								<tr>
									<td><%= d.getFullName() %></td>
									<td><%= d.getDob() %></td>
									<td><%= d.getQualification() %></td>
									<td><%= d.getSpecialist() %></td>
									<td><%= d.getEmail() %></td>
									<td><%= d.getMobNo() %></td>
									<td><%= d.getPassword() %></td>
									<td>
									<!-- url writing follow in edit button it redirect to another page with value -->
									<a href="Edit_Doctor.jsp?id=<%= d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
									<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
									</td>
								</tr>	
								<%}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>