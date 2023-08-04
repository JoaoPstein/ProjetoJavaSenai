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
<link rel="stylesheet" href="style02.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: black;
	overflow: hidden;
	position: relative;
}

.matrix-animation {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
	z-index: -1;
}

.matrix-animation canvas {
	display: block;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	color: #fff;
	text-align: center;
}

.botaoNovoCliente {
	text-decoration: none;
	background-color: rgb(0, 255, 0);
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
	border: 0;
	cursor: pointer;
}

.divButton {
	margin-top: 1rem;
	height: 3rem;
	margin-left: 71rem;
}

.divButton{
	margin-top: 1rem;
	height: 3rem;
	margin-left:71rem;
}
.botao2 {
	text-decoration: none;
	background-color: #d51213;
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
}

.botao1 {
	text-decoration: none;
	background-color: #66bbff;
	padding: 5px 10px 5px 10px;
	color: #fff;
	font-size: 1.2em;
	font-weight: 700;
	border-radius: 5px;
	border: 0;
	cursor: pointer;
}

.title {
	margin-right: 71rem;
	font-size: 32px;
	margin-bottom: 20px;
	color: #fff;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="title">Clientes</h1>
		<div class="divButton">
			<a href="new.html" class="botaoNovoCliente">Novo cliente</a>
		</div>
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
				if (list != null) {
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getPersonType()%></td>
					<td><%=list.get(i).getAddress()%></td>
					<td><%=list.get(i).getRegistration()%></td>
					<td><%=list.get(i).getEnrollmentModality()%></td>
					<td><a href="select?id=<%=list.get(i).getId()%>"
						class="botao1">Editar</a> <a
						href="javascript: confimation(<%=list.get(i).getId()%>)"
						class="botao2">Excluir</a></td>
				</tr>
				<%
				}

				}
				%>
			</tbody>
		</table>
	</div>
	<div class="matrix-animation"></div>
	<script src="scripts/confirmation.js"></script>
	<script>
		// creating the canvas element
		const canvas = document.createElement("canvas");
		const context = canvas.getContext("2d");

		// adding the canvas to the .matrix-animation div
		const matrixAnimation = document.querySelector(".matrix-animation");
		matrixAnimation.appendChild(canvas);

		// setting the canvas size
		const width = (canvas.width = window.innerWidth);
		const height = (canvas.height = window.innerHeight);

		// letters used on Matrix rain
		// more on: https://bit.ly/3yFJoU3
		const letters = [ "日", "ﾊ", "ﾐ", "ﾋ", "ｰ", "ｳ", "ｼ", "ﾅ", "ﾓ", "ﾆ",
				"ｻ", "ﾜ", "ﾂ", "ｵ", "ﾘ", "ｱ", "ﾎ", "ﾃ", "ﾏ", "ｹ", "ﾒ", "ｴ",
				"ｶ", "ｷ", "ﾑ", "ﾕ", "ﾗ", "ｾ", "ﾈ", "ｽ", "ﾀ", "ﾇ", "ﾍ", ":",
				"・", ".", "=", "*", "+", "-", "<",
			">", "¦", "｜", "ﾘ", ];

		const fontSize = 18;

		// defining how many columns to print based on canvas width and font size
		const columns = width / fontSize;

		// creating an array of drops to each column
		const drops = [];

		// starting every drop at a y=1 position
		for (let x = 0; x < columns; x++) {
			drops[x] = 1;
		}

		// drawing the characters
		function draw() {
			// painting the background
			// the trick here is to use opacity
			// so it will fade out with time
			context.fillStyle = "rgba(0, 0, 0, 0.05)";
			context.fillRect(0, 0, width, height);

			// defining font styles (color and font family/size)
			context.fillStyle = "#0F0";
			context.font = `${fontSize}px arial`;

			// drawing the characters
			for (let i = 0; i < drops.length; i++) {
				// get a random letter from the array
				const text = letters[Math.floor(Math.random() * letters.length)];

				// drawing the character
				context.fillText(text, i * fontSize, drops[i] * fontSize);

				// moving the drop to the beginning of the canvas when it reaches the bottom
				// or when the random expression is true in order to make the rain randomly
				if (drops[i] * fontSize > height && Math.random() > 0.975) {
					drops[i] = 0;
				}

				// moving the drop in the Y coordinate
				drops[i]++;
			}

			// recursive call to draw frame by frame
			window.requestAnimationFrame(draw);
		}

		draw();
	</script>
</body>
</html>