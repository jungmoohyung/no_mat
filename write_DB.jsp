<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Database Page</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;

StringBuffer sql = new StringBuffer();

try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "8088");
	pstmt = conn.prepareStatement("insert into jsp (id, password) values(?,?) ");
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	
	
	pstmt.executeUpdate();
	
} catch (SQLException e) {
	e.printStackTrace();
} finally {

	if(pstmt != null)
		try {
			pstmt.close();
		} catch (Exception e) {}
	if(conn != null)
		try {
			conn.close();
		} catch (Exception e) {}
}
%>
ID, Password 저장되었습니다.
</body>
</html>