<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Box 모델 float 속성을 이용한 화면 레이아웃 설정</title>
<link rel="stylesheet" type="text/css" href="./css/common.css" />
</head>
<body>
	<section>
		<jsp:include page="./menus/top.jsp" />
		<jsp:include page="./menus/aside.jsp" />
		<section id="contents">Page Contents 영역</section>
		<jsp:include page="./menus/footer.jsp" />
	</section>
</body>
</html>

