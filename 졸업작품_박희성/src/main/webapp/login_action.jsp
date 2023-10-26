<%@page import="java.io.PrintWriter"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String view_number = request.getParameter("view_number");

try{
	Connection con = Util.getConnection();
	String sql = "select * from sign_in where id = ? and password = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		%>
		<jsp:forward page="index.jsp">
			<jsp:param value="<%=view_number %>" name="notice_view_number"/>
		</jsp:forward>
		<%
	}
	else{
		%>
		<jsp:forward page="login.jsp">
			<jsp:param value="true" name="doplication"/>
		</jsp:forward>
		<%	
	}
	
}
catch(Exception e){
	e.printStackTrace();
}

%>