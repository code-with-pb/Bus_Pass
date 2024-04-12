<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<body>
<%
	
	String name = request.getParameter("student_name");
	String email = request.getParameter("email_add");
	long no = Long.parseLong(request.getParameter("student_mobile"));
	String dob = request.getParameter("student_dob");
	int age = Integer.parseInt(request.getParameter("student_age"));
	String clgnm = request.getParameter("clg_name");
	String clgadd = request.getParameter("clg_add");
	String clgtime = request.getParameter("time1");
	String clgendtime = request.getParameter("time2");
	String homeadd = request.getParameter("hm_add");
	String startingdate = request.getParameter("startingdate");
	String pass1 = request.getParameter("pass");
	String repass1 = request.getParameter("repass");
	String pickup = request.getParameter("busboarding");
	String drop = request.getParameter("busalighting");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","admin");
		PreparedStatement ps = cn.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setLong(3, no);
		ps.setString(4, dob);
		ps.setInt(5, age);
		ps.setString(6, clgnm);
		ps.setString(7, clgadd);
		ps.setString(8, clgtime);
		ps.setString(9, clgendtime);
		ps.setString(10, homeadd);
		ps.setString(11, startingdate);
		ps.setString(12, pass1);
		ps.setString(13, repass1);
		ps.setString(14, pickup);
		ps.setString(15, drop);
		
		ps.executeUpdate();
		
		//out.println("Inserted...........");
		
		cn.close();
	}catch(Exception e){
		out.println(e);
	}

%>
<jsp:forward page = "userlogin.html" />
</body>
</html>