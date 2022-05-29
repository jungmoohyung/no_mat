<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page errorPage="viewErrorMessage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>

<%
String userId=request.getParameter("userId");
String usePw=request.getParameter("userPw");
String title=request.getParameter("title");
String content=request.getParameter("content");
String DB_URL = "jdbc:mysql://192.168.0.17:3306/board";
String DB_USER = "angud";
String DB_PASSWORD= "8088";

Connection conn;
Statement stmt;

try {
 Class.forName("com.mysql.jdbc.Driver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
 stmt = conn.createStatement();
 conn.close();
 out.println("good");
 
 String sql="INSERT INTO store(userId, userPw, title, content)";
 PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setString(1,userId);
 pstmt.setString(2,title);
 pstmt.setString(3,content);
 
 pstmt.executeUpdate();
 
 pstmt.close();
 conn.close();
  } 
catch(ClassNotFoundException e) {
 out.println("e");
}
catch(SQLException e){
	out.println(e);
}
저장되었습니다.

%>
<button><a herf = "member.jsp">a</a></button>
</body>
</html>



