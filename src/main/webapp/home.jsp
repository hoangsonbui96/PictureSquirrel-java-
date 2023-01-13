<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:import url="header.jsp"></c:import>
<div class="content">
	<p id="con-head">Content goes here</p>
	
	<sql:setDataSource var="ds" dataSource="jdbc/webshop"/>
	<sql:query dataSource="${ds}" sql="select * from images limit 10" var="results" />
	
	<table class="images">
		<c:set var="tablewidth" value="8"/>
		
		<c:forEach var="image" items="${results.rows}" varStatus="row">
		
			<c:if test="${row.index % tablewidth == 0 }">
				<tr>
			</c:if>
		
		
			<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>
			<!-- 
				<div style="display: flex; justify-content: center">
					<p>${image.stem}.${image.image_extension}</p>
				</div>
			 -->

			<!--<div style="display: flex; justify-content: center"> -->
				<td>
					<a href="<c:url value="/gallery?action=image&image=${image.id}"/>">
						<img alt="" width="80" src="${pageContext.request.contextPath}/pics/${imgname}">
					</a>
				</td> 
			<!--</div> -->
			
			<c:if test="${row.index + 1 % tablewidth == 0 }">
				</tr>
			</c:if>
			
			
			
		</c:forEach>
	
	
		
	
	</table>
	
	
	
</div>
<c:import url="footer.jsp"></c:import>