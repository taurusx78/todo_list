<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>할일 등록</title>
	<style>
	header {
		padding: 20px;
		text-align: center;
	}
	
	form {
		color: #767676;
		font-size: 20px;
		min-width: 370px;
		width: 50%;
		margin: 0 auto;  /* 가운데 정렬 */
	}
	
	.content {
		margin: 0 0 20px 0;
	}
	
	.info {
		font-size: 20px;
		padding: 7px;
		margin: 7px 0;
	}
	
	#info1 {
		width: 94%;
	}
	
	#info2 {
		width: 44%;
	}
	
	.radioBtn {
		margin: 7px 0 50px 0;
	}
	
	#radio1, #radio2, #radio3 {
		cursor: pointer;
	}
	
	.priority {
		cursor: pointer;
		font-size: 17px;
		margin: 0 20px 0 0;
	}
	
	.backBtn {
		cursor: pointer;
		border: 1px solid gray;
		background-color: white;
		font-size: 17px;
		text-decoration: underline;
		width: 100px;
		height: 40px;
		margin: 0 20px 0 0;
		float: left;
	}
	
	.formBtn {
		cursor: pointer;
		border: 1px solid #c3c3c3;
		background-color: #1fadee;
		color: white;
		font-size: 17px;
		width: 120px;
		height: 40px;
	}
	
	.btn > div {
		text-align: right;
	}
	</style>
</head>
<body>
	<header>
		<h1>할일 등록</h1>
	</header>

	<section>
		<form action="add" method="post">
			<div class="content">
				<span>어떤 일인가요?</span><br>
				<input id="info1" class="info" type="text" name="title" placeholder="swift 공부하기 (24자까지)" maxlength="24" required="true" />
			</div>
	
			<div class="content">
				<span>누가 할 일인가요?</span><br>
				<input id="info2" class="info" type="text" name="name" placeholder="홍길동" required="true" />
			</div>
	
			<div class="content">
				<span>우선순위를 선택하세요</span><br>
				<div class="radioBtn">
					<input type="radio" id="radio1" name="sequence" value=1 required="true" />
					<label class="priority" for="radio1">1순위</label>
					<input type="radio" id="radio2" name="sequence" value=2 required="true" />
					<label class="priority" for="radio2">2순위</label>
					<input type="radio" id="radio3" name="sequence" value=3 required="true" />
					<label class="priority" for="radio3">3순위</label>
				</div>
			</div>
	
			<div class="btn">
				<input class="backBtn" type="button" value="< 이전" onClick="location.href='main'" />
				<div>
					<input class="formBtn" type="submit" value="제출" />
					<input class="formBtn" type="reset" value="내용지우기" />
				</div>
			</div>
		</form>
	</section>
</body>
</html>