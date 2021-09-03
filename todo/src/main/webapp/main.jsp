<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<meta charset=UTF-8">
	<title>메인화면</title>
	<style>
	header {
		height: 100px;
		min-width: 650px;
	}
	
	.main {
		position: absolute;
		top: 30px;
		transform: rotate(-30deg);
		color: #365a6c;
		width: 185px;
	}
	
	.addBtn {
		cursor: pointer;
		position: relative;
		top: 25px;
		border: 1px solid #c3c3c3;
		background-color: #1fadee;
		color: white;
		font-size: 15px;
		width: 185px;
		height: 35px;
		margin: 5px;
		float: right;
	}
	
	section {
		text-align: right;
		min-width: 650px;
		overflow: hidden;
	}
	
	.column {
		display: inline-block;
		vertical-align: top;
		width: 30%;
		margin: 1px;
		text-align: left;
	}
	
	.type {
		background-color: #345461;
		color: white;
		font-size: 20px;
		font-weight: bold;
		padding: 15px;
	}
	
	.card {
		background-color: #cee5ef;
		margin: 8px 0;
		padding: 15px;
		height: 48px;
		overflow: auto;
	}
	
	.title {
		font-weight: bold;
		margin: 0 0 10px 0;
	}
	
	.info {
		color: #4c4c4c;
		font-size: 12px;
	}
	
	.moveBtn {
		cursor: pointer;
		border: 1px solid #BBB;
		box-shadow: 0px 1px 3px #CCC inset;
		font-size: 10px;
		height: 21px;
		width: 24px;
		margin: 0 -8px 0 5px;
		float: right;
	}
	</style>
</head>
<body>
	<header>
		<h2 class="main">나의 해야할 일들</h2>
		<input class="addBtn" type="button" value="새로운 TODO 등록" onClick="location.href='form'" />
	</header>

	<section>
		<div class="column" id="todo">
			<div class="type">TODO</div>
		</div>

		<div class="column" id="doing">
			<div class="type">DOING</div>
		</div>

		<div class="column" id="done">
			<div class="type">DONE</div>
		</div>
	</section>

	<script>
		<c:forEach var="todo" items="${todos}">
			var card = document.createElement("div");
			var title = document.createElement("p");
			var div = document.createElement("div");	
			var info = document.createElement("span");
			title.innerHTML = "${todo.title}";
			info.innerHTML = "${todo}";
			card.className = "card";
			title.className = "title";
			info.className = "info";
			
			var moveBtn = document.createElement("button");
			moveBtn.setAttribute("name", "${todo.id}");
			moveBtn.setAttribute("value", "${todo.type}");
			moveBtn.setAttribute("onClick", "makeRequest(this)");
			moveBtn.innerHTML = "➔";
			moveBtn.className = "moveBtn";

			var column;
			if("${todo.type}" === "TODO") {
				column = document.querySelector("#todo");
				div.appendChild(moveBtn);
			} else if("${todo.type}" === "DOING") {
				column = document.querySelector("#doing");
				div.appendChild(moveBtn);
			} else {
				column = document.querySelector("#done");
			}
			
			div.appendChild(info);
			card.appendChild(title);
			card.appendChild(div);
			column.appendChild(card);
		</c:forEach>
		
		function makeRequest(button) {
			var xhr = new XMLHttpRequest();
			var id = button.name;
			var type = button.value;
			
			xhr.addEventListener("load", function() {
				if(xhr.responseText == "success") {
					if(type == "TODO") {
						document.querySelector("#todo").removeChild(button.parentNode.parentNode);
						document.querySelector("#doing").appendChild(button.parentNode.parentNode);
						button.value = "DOING";
					} else {
						document.querySelector("#doing").removeChild(button.parentNode.parentNode);
						document.querySelector("#done").appendChild(button.parentNode.parentNode);
						button.parentNode.removeChild(button);
					}
				}
			});
			
			xhr.open("POST", "type");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("id=" + encodeURIComponent(id) + "&type=" + encodeURIComponent(type));
		}
	</script>
</body>
</html>