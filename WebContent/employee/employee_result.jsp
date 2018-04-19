<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>사원등록 결과</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey">

  <!-- Page content -->
  <div class="w3-content" style="width: 450px;">
    <div
      class="w3-container w3-padding-32 w3-margin w3-black w3-opacity">
      <h2>사원등록 결과</h2>
      <h4>정상적으로 사원등록 처리되었습니다.</h4>
      <p>사원번호 : <%=request.getParameter("employee_id") %></p>
      <p>사원이름 : <%=request.getParameter("last_name") %></p>
      <p>연봉 : <%=request.getParameter("salary") %></p>
      <div class="w3-center"><button class="w3-button w3-green w3-margin-top">홈으로</button></div>
    </div>
  </div>

</body>
</html>