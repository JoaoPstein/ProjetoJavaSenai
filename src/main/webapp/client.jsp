<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.JavaBeans"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<JavaBeans> list = (ArrayList<JavaBeans>) request.getAttribute("Clients");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Clientes</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>Clientes</h1>
	<a href="new.html" class="Botao1">Novo cliente</a>
	<table id="tabela">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Tipo pessoa</th>
				<th>Endereço</th>
				<th>Matricula</th>
				<th>Tipo da matricula</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getPersonType()%></td>
				<td><%=list.get(i).getAddress()%></td>
				<td><%=list.get(i).getRegistration()%></td>
				<td><%=list.get(i).getEnrollmentModality()%></td>
				<td>
					<a href="select?id=<%=list.get(i).getId()%>"
					class="Botao1">Editar</a>
					<a href="javascript: confirmar(<%=list.get(i).getId()%>)"
					class="Botao2">Excluir</a>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<script src="scripts/confirmador.js"></script>
</body>
</html>