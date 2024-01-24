<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: kmpl_nischal1--%>
<%--  Date: 3/4/2023--%>
<%--  Time: 9:03 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Login</title>--%>
<%--  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" type="text/css">--%>
<%--  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">--%>
<%--  <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--</head>--%>
<%--<body>--%>
<%--<img class="wave" src="tung.png">--%>
<%--<div class="container">--%>
<%--  <div class="img">--%>
<%--    <img src="login-removebg-preview.png">--%>
<%--  </div>--%>
<%--  <div class="login-content">--%>
<%--    <form method="post" action="login" >--%>
<%--      <img src="aa-removebg-preview.png">--%>
<%--      <h2 class="title">Welcome</h2>--%>
<%--      <div class="input-div one">--%>
<%--        <div class="i">--%>
<%--          <i class="fas fa-user"></i>--%>
<%--        </div>--%>

<%--        <div class="div">--%>

<%--          <input type="email" name="email" placeholder="username" class="input">--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="input-div pass">--%>
<%--        <div class="i">--%>
<%--          <i class="fas fa-lock"></i>--%>
<%--        </div>--%>
<%--        <div class="div">--%>

<%--          <input type="password" name="password"  placeholder="password" class="input">--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <a href="#">--%>
<%--        <input type="submit" class="btn" value="Login">--%>
<%--      </a>--%>
<%--    </form>--%>
<%--  </div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

<%--
  Created by IntelliJ IDEA.
  User: kmpl_nischal1
  Date: 3/4/2023
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<img class="wave" src="tung.png">
<div class="container">
  <div class="img">
    <img src="login-removebg-preview.png">
  </div>
  <div class="login-content">
    <form method="post" action="login" id="login-form">
      <img src="aa-removebg-preview.png">
      <h2 class="title">Welcome</h2>
      <div class="input-div one">
        <div class="i">
          <i class="fas fa-user"></i>
        </div>

        <div class="div">

          <input type="email" name="email" placeholder="username" class="input"  >
        </div>
      </div>
      <div class="input-div pass">
        <div class="i">
          <i class="fas fa-lock"></i>
        </div>
        <div class="div">

          <input type="password" name="password"  placeholder="password" class="input" >
        </div>
      </div>
      <button type="submit" class="btn">Login</button>
    </form>
  </div>
</div>

<script>
  const loginForm = document.getElementById('login-form');

  loginForm.addEventListener('submit', (event) => {
    // Prevent the form from being submitted
    event.preventDefault();

    // Validate the form
    if (loginForm.checkValidity()) {
      // If the form is valid, submit it
      loginForm.submit();
    } else {
      // If the form is not valid, show an error message or highlight the invalid fields
      // For example, you can show an alert message
      alert('Please fill out all required fields.');
    }
  });
</script>
</body>
</html>


