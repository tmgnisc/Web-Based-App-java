<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
    <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

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
            <a href="index.jsp" class="active">
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
            <a href="user-list.jsp?page=1">
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
            <span class="dashboard">Dashboard</span>
        </div>

        <div class="profile-details">

            <span class="admin_name">Admin</span>
            <a href="login.jsp">
                <i class="fa-solid fa-right-from-bracket"></i>

            </a>
        </div>
    </nav>

    <div class="home-content">
        <div class="overview-boxes">
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Employee
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div class="number">20</div>

                </div>

            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Department
                        <i class="fa-regular fa-calendar"></i>
                    </div>

                    <div class="number">3</div>

                </div>

            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Absconded
                        <i class="fa-solid fa-person-walking-arrow-right"></i>
                    </div>
                    <div class="number">0</div>

                </div>

            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Policy
                        <i class="fa-solid fa-envelope"></i>
                    </div>
                    <div class="number">5</div>

                </div>

            </div>
        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">CMM Policy</div>
                <div class="sales-details">
                    <ul class="details">
                        <li class="topic">Points</li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Policy</li>
                        <li><a href="#">Do not use mobile phone on duty time.</a></li>
                        <li><a href="#">Reporting should be done weekly.</a></li>
                        <li><a href="#">Escalation Matrix should be followed.</a></li>
                        <li><a href="#">Employee should inform Supervisor for every incident.</a></li>
                        <li><a href="#">Incentive criteria should be maintained every month.</a></li>
                        <li><a href="#">Employee can get 1.5 days paid leave.</a></li>
                        <li><a href="#">Supervisor should report every details to HR.</a></li>


                    </ul>
                    <!-- <ul class="details">
                      <li class="topic">Progress</li>
                      <li><a href="#">Contract</a></li>
                      <li><a href="#">Pending</a></li>
                      <li><a href="#">Contract</a></li>
                      <li><a href="#">Completed</a></li>
                      <li><a href="#">Pending</a></li>
                      <li><a href="#">Completed</a></li>
                      <li><a href="#">Contract</a></li>

                    </ul> -->


                    </ul>
                </div>
                <div class="button">

                </div>
            </div>
            <div class="top-sales box">

                <img src="download.jpg" style="height: 50%;">
                </ul>
            </div>
        </div>
    </div>
</section>

<script>
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".sidebarBtn");
    sidebarBtn.onclick = function() {
        sidebar.classList.toggle("active");
        if(sidebar.classList.contains("active")){
            sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
        }else
            sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
    }
</script>

</body>
</html>

