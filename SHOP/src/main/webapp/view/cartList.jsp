<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 10px auto;
	width: 800;
	border-collapse: collapse;
	font-size: 8pt;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	function delete_go(f) {
		location.href = "/MyController?cmd=cartdelete&idx="+f;
	}

</script>
</head>
<body>
	<c:if test="${login != 'ok' }">
		<c:redirect url="/MyController">
		<c:param name="cmd" value="login"/>
		</c:redirect>
	</c:if>
	<jsp:include page="top.jsp"/>
	<table>
		<caption>
			<h2>:: 장바구니 내용 ::</h2>
		</caption>
			<thead>
				<tr bgcolor="#dedede">
					<th style="width: 10%">제품번호</th>
					<th style="width= 15%">제품명</th>
					<th style="width= 25%">단가</th>
					<th style="width= 15%">수량</th>
					<th style="width= 10%">금액</th>
					<th style="width= 10%">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
				<c:when test="${empty cartlist}">
					<tr><td colspan="6"><h3>장바구니에 담은 상품이 없습니다.</h3></td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${cartlist}">
						<tr>
							<td>${k.p_num }</td>
							<td>${k.p_name }</td>
							<td><fmt:formatNumber value="${k.p_price }" pattern="#,##0" /></td>
							<td>
								<form action="/MyController?cmd=editcont">
									<input type="number" name="p_su" value="${k.p_su }" size="1">
									<input type="hidden" name="p_num" value="${k.p_num }">
									<input type="hidden" name="m_id" value="${k.m_id}">
									<input type="submit" value="수정">
								</form>
						
							</td>
							
							
							<td><fmt:formatNumber value="${k.p_price *k.p_su}" pattern="#,##0" /></td>
							<td><button onclick="delete_go(${k.idx})">삭제</button></td>
						</tr>
						<c:set var=""cartTotal" value="${cartTotal = cartTotal +(k.p_price *k.p_su)  }"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan ="6" style="text-align: right; padding: 10px 50px"> 총 결제액 : ${cartTotal}</td>
				</tr>
			</tfoot>
	</table>
</body>
</html>