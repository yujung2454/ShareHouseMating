<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table {
	width:600px;
	height:30%;
	text-align:center;
	margin:auto;
}
</style>
</head>
<body>
<h1>��� �Խù� ����</h1>
<div>
<select name="board">
<option value="��ü����">��ü����</option>
<option value="���ù�">�Խù�</option>
<option value="�Ź�">�Ź�</option>
</select>
</div>

<table border="1" >
<tr>
<td width="150px">�Խù� ��ȣ</td>
<td width="150px">���̵�</td>
<td width="150px">����</td>
<td width="150px">��ȸ��</td>
</tr>
<tr>
<td>${comm_no }</td>
<td>${id }</td>
<td>${comm_title }</td>
<td>${comm_v_cnt }</td>
</tr>
</table>
</body>
</html>