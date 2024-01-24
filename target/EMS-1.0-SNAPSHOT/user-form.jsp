<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Employee Management system</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script src="https://unpkg.com/react/umd/react.production.min.js"></script>
    <script src="https://unpkg.com/react-dom/umd/react-dom.production.min.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://unpkg.com/react@17.0.2/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.development.js"></script>


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
            <a href="index.jsp">
                <i class="fa-solid fa-house"></i>
                <span class="links_name">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="department.jsp">
                <i class="fa-regular fa-calendar"></i>
                <span class="links_name">Department</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/users/list">
                <i class='bx bx-list-ul'></i>
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
    <br>
    <br>

    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${user != null}">
                <form action="<%=request.getContextPath()%>/users/update" method="post">
                    </c:if>
                    <c:if test="${user == null}">
                    <form action="<%=request.getContextPath()%>/users/insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${user != null}">
                                    Edit User
                                </c:if>
                                <c:if test="${user == null}">
                                    Add New User
                                </c:if>
                            </h2>
                        </caption>
                        <div style="color: #FF0000;">${errorMessage}</div>
                        <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                        </c:if>

                        <form method="POST" action="" onsubmit="validateForm()">
                            <fieldset class="form-group">
                                <label>User Name</label> <input type="text" id="name"
                                                                value="<c:out value='${user.name}' />"
                                                                class="form-control"
                                                                name="name">
                            </fieldset>

                            <c:if test="${user == null}">
                                <fieldset class="form-group">
                                    <label>User Email</label> <input type="email" id="email"
                                                                     value="<c:out value='${user.email}' />"
                                                                     class="form-control"
                                                                     name="email">
                                </fieldset>
                            </c:if>


                            <fieldset class="form-group">
                                <label>Address</label> <input type="text" id="address"
                                                              value="<c:out value='${user.address}' />"
                                                              class="form-control"
                                                              name="address">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Department</label> <input type="text" id="department"
                                                                 value="<c:out value='${user.department}' />"
                                                                 class="form-control"
                                                                 name="department">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Password</label> <input type="password" id="password"
                                                               value="<c:out value='${user.password}' />"
                                                               class="form-control"
                                                               name="password">
                            </fieldset>


                            <button type="submit" class="btn btn-success">Save</button>
                        </form>
                        <script>
                            function validateForm() {
                                // Sanitize inputs to prevent XSS attacks
                                const name = sanitizeInput(document.getElementById("name").value);
                                const email = sanitizeInput(document.getElementById("email").value);
                                const address = sanitizeInput(document.getElementById("address").value);
                                const department = sanitizeInput(document.getElementById("department").value);
                                const password = sanitizeInput(document.getElementById("password").value);

                                // Validate email format using regex
                                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                if (!emailRegex.test(email)) {
                                    alert("Please enter a valid email address.");
                                    return false;
                                }

                                // Validate password length
                                if (password.length < 8) {
                                    alert("Password must be at least 8 characters long.");
                                    return false;
                                }

                                // If all inputs are valid, submit the form
                                return true;
                            }

                            function sanitizeInput(input) {
                                // Replace any HTML tags and entities with their plain text equivalents
                                const tempElement = document.createElement("div");
                                tempElement.innerText = input;
                                return tempElement.innerHTML;
                            }
                        </script>
            </div>
        </div>
    </div>
</section>

</body>
</html>
    