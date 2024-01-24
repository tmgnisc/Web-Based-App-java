<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.User" %>
<%@ page import="com.example.ems.UserServlet" %>
<html>
<head>
  <title>Employee Management system</title>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">


  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="sidebar">
  <div class="logo-details">
    <i>

    </i>
    <span class="logo_name">Employee Management</span>
  </div>
  <ul class="nav-links">
    <li>
      <a href="index.jsp" >
        <i class="fa-solid fa-house"></i>
        <span class="links_name">Dashboard</span>
      </a>
    </li>
    <li>
      <a href="department.jsp" >
        <i class="fa-regular fa-calendar"></i>
        <span class="links_name">Department</span>
      </a>
    </li>
    <li>
      <a href="<%=request.getContextPath()%>/users/list">
        <i class='bx bx-list-ul' ></i>
        <span class="links_name">Employee details</span>
      </a>
    </li>



  </ul>
</div>
<section class="home-section">
  <nav>
    <div class="sidebar-button">
      <i class='bx bx-menu sidebarBtn'></i>
      <span class="dashboard">Employee Details</span>
    </div>

    <div class="profile-details">

      <span class="admin_name">Admin</span>
      <a href="login.jsp">
        <i class="fa-solid fa-right-from-bracket"></i>
      </a>
    </div>
  </nav>
  <br>
  <br>


  <div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
      <h3 class="text-center">List of Users</h3>
      <hr>
      <div class="container text-left">

        <a href="<%=request.getContextPath()%>/users/new" class="btn btn-success">Add
          New User</a>
      </div>
      <br>
      <br>

      <table class="table table-bordered">
        <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Address</th>
          <th>Department</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
            <h1> Page No: </h1>
        <c:forEach var="user" items="${listUser}">
          <tr>
            <td><c:out value="${user.id}" /></td>
            <td><c:out value="${user.name}" /></td>
            <td><c:out value="${user.email}" /></td>
            <td><c:out value="${user.address}" /></td>
            <td><c:out value="${user.department}" /></td>
            <td><a href="edit?id=<c:out value='${user.id}' />">Edit</a>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <a href="delete?id=<c:out value='${user.id}' />">delete</a></td>
          </tr>
        </c:forEach>

        </tbody>

      </table>
    </div>
  </div>
</section>
</body>
</html>
