<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${fbi2 == null}">
<script>
	alert("가입된 정보가 없습니다.")
	history.go(-1)
</script>
</c:if>
<c:if test="${fbi2 != null}">
${fbi2 }
</c:if>


</body>
</html>