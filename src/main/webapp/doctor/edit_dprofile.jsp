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
<title>Doctor Edit Page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<c:if test="${empty doctorobj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty sucmsg }">
						<p class="text-center text-success fs-3">${sucmsg}</p>
						<c:remove var="sucmsg" scope="session" />
					</c:if>

					<c:if test="${not empty errormsg }">
						<p class="text-center text-danger fs-5">${errormsg}</p>
						<c:remove var="errormsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctorobj.id}" name="uid">
							<button class="btn btn-primary col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-2 text-center">Edit Doctor Details</p>
						<c:if test="${not empty sucmsgd }">
							<p class="text-center text-success fs-3">${sucmsgd}</p>
							<c:remove var="sucmsgd" scope="session" />
						</c:if>

						<c:if test="${not empty errormsgd }">
							<p class="text-center text-danger fs-5">${errormsgd}</p>
							<c:remove var="errormsgd" scope="session" />
						</c:if>
						<form action="../doctorUpdateProfile" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctorobj.fullName }">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctorobj.dob }">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control"
									value="${doctorobj.qualification }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option>${doctorobj.specialist }</option>
									<%
									SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${doctorobj.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control"
									value="${doctorobj.mobNo }">
							</div>

							<input type="hidden" name="id" value="${doctorobj.id }">
							<button type="submit" class="btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>