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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<h1>Clientes</h1>
	<a href="new.html" class="Botao3">Novo cliente</a>
	<table class="table table-dark table-striped">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Nome</th>
				<th scope="col">Tipo pessoa</th>
				<th scope="col">Endereço</th>
				<th scope="col">Matricula</th>
				<th scope="col">Tipo da matricula</th>
				<th scope="col">Opções</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
			    <td><%=list.get(i).getId()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getPersonType()%></td>
				<td><%=list.get(i).getAddress()%></td>
				<td><%=list.get(i).getRegistration()%></td>
				<td><%=list.get(i).getEnrollmentModality()%></td>
				<td><a href="select?id=<%=list.get(i).getId()%>" class="Botao1">Editar</a>
					<a href="javascript: confimation(<%=list.get(i).getId()%>)"
					class="Botao2">Excluir</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="scripts/confirmation.js"></script>
</body>
</html>