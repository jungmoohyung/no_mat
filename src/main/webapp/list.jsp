<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Database Page</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<%
String Name = request.getParameter("Name");
String Phonnumber = request.getParameter("Phonnumber");
String date = request.getParameter("date");
String Message = request.getParameter("Message");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;

StringBuffer sql = new StringBuffer();

try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/list", "root", "8088");
	pstmt = conn.prepareStatement("insert into member (Name, Phonnumber, date, Message) values(?,?,?,?) ");
	pstmt.setString(1, Name);
	pstmt.setString(2, Phonnumber);
	pstmt.setString(3, date);
	pstmt.setString(4, Message);
	
	
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
response.sendRedirect("member.jsp");
%>

</body>
</html>