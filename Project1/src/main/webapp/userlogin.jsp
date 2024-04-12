<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<body>
<%
	String s1 = (String)(request.getParameter("Email"));
	String s2 = (String)(request.getParameter("passward"));
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","admin");
		Statement st = cn.createStatement();
		
		ResultSet rs = st.executeQuery("select * from student");
		
		while(rs.next()){
			//String nm = rs.getString(1);
			String email = rs.getString(2);
			String pass = rs.getString(13);
			if((s1.equals(email))&& s2.equals(pass)){
			%>
				<jsp:forward page="passtype.html"></jsp:forward>
			<%
			}
		}
	}catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>