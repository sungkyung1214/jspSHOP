<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
	margin: 20px auto;
	width: 500px;
	border: 1px solid gray;
	padding: 20px;
	}

	input{
		padding: 10px;
		margin: 10px;
		
	}
</style>
<script type="text/javascript">
	function login_go(f) {
		// 유효성 검사
		f.action="/MyController?cmd=loginok";
		f.submit();
	}
	function join_go(f) {
		// 유효성 검사
		f.action="/MyController?cmd=join";
		f.submit();
	}
	
</script>
</head>
<body>
<jsp:include page="top.jsp" />
	<div id="mydiv">
		<form method="post">
			<table>
				<thead>
					<th colspan="2"><h2>Login</h2> </th>
				</thead>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="m_id"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="m_pw"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr style="text-align: center;">
						<td colspan="2">
							<input type="button" value="로그인" onclick="login_go(this.form)">
							<input type="button" value="회원가입" onclick="join_go(this.form)">
							
						</td>
					</tr>
				</tfoot>
			</table>
		
		</form>
	</div>
</body>
</html>