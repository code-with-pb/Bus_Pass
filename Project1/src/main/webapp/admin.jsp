<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String unm = (String)(request.getParameter("username"));
	String pass = (String)(request.getParameter("password"));
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","admin");
		Statement st = cn.createStatement();
		//String un = ps.getString(1,"username");
		
		ResultSet rs = st.executeQuery("select * from admin");;
		//rs = st.executeQuery("select * from admin");
		//String uname = rs.getString(1);
		//String apass = rs.getString(2);
		while(rs.next()){
			String uname = rs.getString(1);
			String apass = rs.getString(2);
			if((unm.equals(uname)) && pass.equals(apass)){
				out.println("Welcome");
			}
			else{
				out.println("Failed");
				out.println("<br><br><a href=admin.html>Login</a>");
			}
		}
		rs.close();
		cn.close();
	}catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>