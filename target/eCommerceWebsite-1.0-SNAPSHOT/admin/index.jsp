<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
          content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, AdminWrap lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, AdminWrap lite design, AdminWrap lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
          content="AdminWrap Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Admin Venus Shop</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/adminwrap-lite/"/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../admin/images/favicon.png">
    <!-- Bootstrap Core CSS -->
    <link href="../admin/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../admin/node_modules/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="../admin/node_modules/morrisjs/morris.css" rel="stylesheet">
    <!--c3 CSS -->
    <link href="../admin/node_modules/c3-master/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../admin/html/css/style.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="../admin/html/css/pages/dashboard1.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../admin/html/css/colors/default.css" id="theme" rel="stylesheet">
</head>
<body class="fix-header fix-sidebar card-no-border">
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    <%@ include file="header.jsp" %>
    <%@ include file="slidebar.jsp" %>

    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Dashboard</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
                <div class="col-md-7 align-self-center">
                    <a href="logout"
                       class="btn waves-effect waves-light btn btn-info pull-right hidden-sm-down text-white">Log
                        out</a>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Sales Chart and browser state-->
            <!-- ============================================================== -->
            <div class="row">
                <!-- Column -->
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex no-block">
                                <div>
                                    <h5 class="card-title mb-0">Sales Chart</h5>
                                </div>
                                <div class="ms-auto">
                                    <ul class="list-inline text-center font-12">
                                        <li><i class="fa fa-circle text-success"></i> SITE A</li>
                                        <li><i class="fa fa-circle text-info"></i> SITE B</li>
                                        <li><i class="fa fa-circle text-primary"></i> SITE C</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="" id="sales-chart" style="height: 355px;"></div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex mb-4 no-block">
                                <h5 class="card-title mb-0 align-self-center">Our Visitors</h5>
                                <div class="ms-auto">
                                    <select class="form-select b-0">
                                        <option selected="">Today</option>
                                        <option value="1">Tomorrow</option>
                                    </select>
                                </div>
                            </div>
                            <div id="visitor" style="height:260px; width:100%;"></div>
                            <ul class="list-inline mt-4 text-center font-12">
                                <li><i class="fa fa-circle text-purple"></i> Tablet</li>
                                <li><i class="fa fa-circle text-success"></i> Desktops</li>
                                <li><i class="fa fa-circle text-info"></i> Mobile</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Sales Chart -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Projects of the Month -->
            <!-- ============================================================== -->
            <div class="row">
                <!-- Column -->
                <div class="col-lg-8 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="d-flex">
                                <div>
                                    <h5 class="card-title">Projects of the Month</h5>
                                </div>
                                <div class="ms-auto">
                                    <select class="form-select b-0">
                                        <option selected="">January</option>
                                        <option value="1">February</option>
                                        <option value="2">March</option>
                                        <option value="3">April</option>
                                    </select>
                                </div>
                            </div>
                            <div class="table-responsive mt-3 no-wrap">
                                <table class="table vm no-th-brd pro-of-month">
                                    <thead>
                                    <tr>
                                        <th colspan="2">Assigned</th>
                                        <th>Name</th>
                                        <th>Budget</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td style="width:50px;"><span class="round">S</span></td>
                                        <td>
                                            <h6>Sunil Joshi</h6><small class="text-muted">Web Designer</small>
                                        </td>
                                        <td>Elite Admin</td>
                                        <td>$3.9K</td>
                                    </tr>
                                    <tr class="active">
                                        <td><span class="round"><img src="../admin/images/users/2.jpg"
                                                                     alt="user" width="50"></span></td>
                                        <td>
                                            <h6>Andrew</h6><small class="text-muted">Project Manager</small>
                                        </td>
                                        <td>Real Homes</td>
                                        <td>$23.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-success">B</span></td>
                                        <td>
                                            <h6>Bhavesh patel</h6><small class="text-muted">Developer</small>
                                        </td>
                                        <td>MedicalPro Theme</td>
                                        <td>$12.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-primary">N</span></td>
                                        <td>
                                            <h6>Nirav Joshi</h6><small class="text-muted">Frontend Eng</small>
                                        </td>
                                        <td>Elite Admin</td>
                                        <td>$10.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-warning">M</span></td>
                                        <td>
                                            <h6>Micheal Doe</h6><small class="text-muted">Content Writer</small>
                                        </td>
                                        <td>Helping Hands</td>
                                        <td>$12.9K</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <!-- Column -->
                <div class="col-lg-4 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="up-img" style="background-image:url(../admin/images/big/img1.jpg)"></div>
                        <div class="card-body">
                            <h5 class=" card-title">Business development of rules</h5>
                            <span class="label label-info label-rounded">Technology</span>
                            <p class="mb-0 mt-3">Titudin venenatis ipsum aciat. Vestibu ullamer quam. nenatis
                                ipsum ac feugiat. Ibulum ullamcorper.</p>
                            <div class="d-flex mt-3">
                                <a class="link" href="javascript:void(0)">Read more</a>
                                <div class="ms-auto align-self-center">
                                    <a href="javascript:void(0)" class="link me-2"><i
                                            class="fa fa-heart-o"></i></a>
                                    <a href="javascript:void(0)" class="link me-2"><i
                                            class="fa fa-share-alt"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Projects of the Month -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Notification And Feeds -->
            <!-- ============================================================== -->
            <div class="row">
                <!-- Start Notification -->
                <div class="col-lg-6 col-md-12">
                    <div class="card card-body mailbox">
                        <h5 class="card-title">Notification</h5>
                        <div class="message-center" style="height: 420px !important;">
                            <!-- Message -->
                            <a href="#">
                                <div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>
                                <div class="mail-contnet">
                                    <h6 class="text-dark font-medium mb-0">Luanch Admin</h6> <span class="mail-desc">Just see the my new admin!</span>
                                    <span class="time">9:30 AM</span>
                                </div>
                            </a>
                            <!-- Message -->
                            <a href="#">
                                <div class="btn btn-success btn-circle"><i class="fa fa-calendar-check-o"></i></div>
                                <div class="mail-contnet">
                                    <h6 class="text-dark font-medium mb-0">Event today</h6> <span class="mail-desc">Just a reminder that you have
                                            event</span> <span class="time">9:10 AM</span>
                                </div>
                            </a>
                            <!-- Message -->
                            <a href="#">
                                <div class="btn btn-info btn-circle"><i class="fa fa-cog text-white"></i></div>
                                <div class="mail-contnet">
                                    <h6 class="text-dark font-medium mb-0">Settings</h6> <span class="mail-desc">You can customize this template as you
                                            want</span> <span class="time">9:08 AM</span>
                                </div>
                            </a>
                            <!-- Message -->
                            <a href="#">
                                <div class="btn btn-primary btn-circle"><i class="fa fa-user"></i></div>
                                <div class="mail-contnet">
                                    <h6 class="text-dark font-medium mb-0">Pavan kumar</h6> <span class="mail-desc">Just see the my admin!</span>
                                    <span
                                            class="time">9:02 AM</span>
                                </div>
                            </a>
                            <!-- Message -->
                            <a href="#">
                                <div class="btn btn-info btn-circle"><i class="fa fa-cog text-white"></i></div>
                                <div class="mail-contnet">
                                    <h6 class="text-dark font-medium mb-0">Customize Themes</h6> <span
                                        class="mail-desc">You can customize this template as you
                                            want</span> <span class="time">9:08 AM</span>
                                </div>
                            </a>
                            <!-- Message -->
                            <a href="#">
                                <div class="btn btn-primary btn-circle"><i class="fa fa-user"></i></div>
                                <div class="mail-contnet">
                                    <h6 class="text-dark font-medium mb-0">Pavan kumar</h6> <span class="mail-desc">Just see the my admin!</span>
                                    <span
                                            class="time">9:02 AM</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- End Notification -->
                <!-- Start Feeds -->
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Feeds</h5>
                            <ul class="feeds">
                                <li>
                                    <div class="bg-light-info"><i class="fa fa-bell-o"></i></div>
                                    You have 4 pending
                                    tasks. <span class="text-muted">Just Now</span>
                                </li>
                                <li>
                                    <div class="bg-light-success"><i class="fa fa-server"></i></div>
                                    Server #1
                                    overloaded.<span class="text-muted">2 Hours ago</span>
                                </li>
                                <li>
                                    <div class="bg-light-warning"><i class="fa fa-shopping-cart"></i></div>
                                    New
                                    order received.<span class="text-muted">31 May</span>
                                </li>
                                <li>
                                    <div class="bg-light-danger"><i class="fa fa-user"></i></div>
                                    New user
                                    registered.<span class="text-muted">30 May</span>
                                </li>
                                <li>
                                    <div class="bg-light-inverse"><i class="fa fa-bell-o"></i></div>
                                    New Version
                                    just arrived. <span class="text-muted">27 May</span>
                                </li>
                                <li>
                                    <div class="bg-light-info"><i class="fa fa-bell-o"></i></div>
                                    You have 4 pending
                                    tasks. <span class="text-muted">Just Now</span>
                                </li>
                                <li>
                                    <div class="bg-light-danger"><i class="fa fa-user"></i></div>
                                    New user
                                    registered.<span class="text-muted">30 May</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End Feeds -->
            </div>
            <!-- ============================================================== -->
            <!-- End Notification And Feeds -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End Page Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer"> © 2021 Adminwrap by <a href="https://www.wrappixel.com/">wrappixel.com</a></footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../admin/node_modules/jquery/jquery.min.js"></script>
<!-- Bootstrap popper Core JavaScript -->
<script src="../admin/node_modules/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slim-scrollbar scrollbar JavaScript -->
<script src="../admin/html/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="../admin/html/js/waves.js"></script>
<!--Menu sidebar -->
<script src="../admin/html/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="../admin/html/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!--morris JavaScript -->
<script src="../admin/node_modules/raphael/raphael-min.js"></script>
<script src="../admin/node_modules/morrisjs/morris.min.js"></script>
<!--c3 JavaScript -->
<script src="../admin/node_modules/d3/d3.min.js"></script>
<script src="../admin/node_modules/c3-master/c3.min.js"></script>
<!-- Chart JS -->
<script src="../admin/html/js/dashboard1.js"></script>
</body>
</html>