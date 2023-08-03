<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Lista de clientes - Editar</title>
<link rel="stylesheet" href="style02.css">
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

form {
	margin-bottom: 20px;
}

table {
	margin-bottom: 20px;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 10px;
	border: 1px solid #fff;
}

th {
	background-color: #333;
}

input[type="text"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	transition: border-color 0.3s;
}

input[type="text"]:focus {
	outline: none;
	border-color: #fff;
}

input[type="button"] {
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="button"]:hover {
	background-color: #555;
}

/* Estilo do botão "Cadastrar" */
.Botao1 {
	display: inline-block;
	margin-top: 10px;
}

/* Estilo das células da tabela */
table td {
	border-bottom: 1px solid #fff;
}

/* Estilo das células da última linha da tabela */
table tr:last-child td {
	border-bottom: none;
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

</style>
</head>
<body>
	<div class="container">
		<h1>Editar cliente</h1>
		<form name="frmClient" action="update">
			<table>
				<tr>
					<th class="th">Id</th>
					<td><input type="text" name="id" readonly class="Caixa1"
						value="<%out.print(request.getAttribute("id"));%>"></td>
				</tr>
				<tr>
					<th class="th">Nome</th>
					<td><input type="text" name="name" class="Caixa1"
						value="<%out.print(request.getAttribute("name"));%>"></td>
				</tr>
				<tr>
					<th>Tipo pessoa</th>
					<td><input type="text" name="personType" readonly
						class="Caixa1"
						value="<%out.print(request.getAttribute("personType"));%>"></td>
				</tr>
				<tr>
					<th>Endereço</th>
					<td><input type="text" name="address" class="Caixa1"
						value="<%out.print(request.getAttribute("address"));%>"></td>
				</tr>
				<tr>
					<th>Matricula</th>
					<td><input type="text" name="registration" readonly
						class="Caixa1"
						value="<%out.print(request.getAttribute("registration"));%>"></td>
				</tr>
				<tr>
					<th>Tipo da matricula</th>
					<td><input type="text" name="enrollmentModality"
						class="Caixa1"
						value="<%out.print(request.getAttribute("enrollmentModality"));%>"></td>
				</tr>
			</table>
			<input type="button" value="Salvar" class="botaoNovoCliente"
				onclick="validator()">
		</form>
	</div>
	<script src="scripts/validator.js"></script>
	<div class="matrix-animation"></div>
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