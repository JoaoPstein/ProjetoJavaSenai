<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Lista de clientes - Editar</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>Editar cliente</h1>
	<form name="frmClient" action="update">
		<table>
			<tr>
				<td><input type="text" name="id" id="caixa1" readonly
					value="<%out.print(request.getAttribute("id"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="name" class="Caixa1"
					value="<%out.print(request.getAttribute("name"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="personType" class="Caixa1"
					value="<%out.print(request.getAttribute("personType"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="address" class="Caixa1"
					value="<%out.print(request.getAttribute("address"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="registration" class="Caixa1"
					value="<%out.print(request.getAttribute("registration"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="enrollmentModality" class="Caixa1"
					value="<%out.print(request.getAttribute("enrollmentModality"));%>"></td>
			</tr>
		</table>
		<input type="button" value="Salvar" class="Botao1" onclick="validator()">
	</form>
	<script src="scripts/validator.js"></script>
</body>
</html>