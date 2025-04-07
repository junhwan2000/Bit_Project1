<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${toemail eq key}">   
	<script type="text/javascript">
		<c:redirect url="mailForm" />
	</script>
</c:if>
<c:if test="${result ne key}">
	<script type="text/javascript">
		erroralert(error_passwd);
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="mailForm" />	
</c:if>