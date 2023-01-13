<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sql:setDataSource var="ds" dataSource="jdbc/webshop"/>
	<sql:query dataSource="${ds}" sql="select * from images where id=?" var="results" >
		<sql:param>${param.image}</sql:param>
	</sql:query>

	<c:set scope="page" var="image" value="${results.rows[0]}"></c:set>
	<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>
	
	
	<img alt="" src="${pageContext.request.contextPath}/pics/${imgname}">
</body>
</html>