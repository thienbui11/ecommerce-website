<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
    <title>
        <c:if test="${user != null}">Edit User - Administration</c:if>
        <c:if test="${user == null}">Create User - Administration</c:if>
    </title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/adminwrap-lite/"/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../admin/images/favicon.png">
    <!-- Bootstrap Core CSS -->
    <link href="../admin/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../admin/html/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../admin/html/css/colors/default.css" id="theme" rel="stylesheet">
</head>
<body class="fix-header card-no-border fix-sidebar">
<%@ include file="header.jsp" %>
<%@ include file="slidebar.jsp" %>
<!--end of Navigation bar-->
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
                <h3 class="text-themecolor">User</h3>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">User</li>
                </ol>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <!-- Row -->
        <div class="row">
            <!-- Column -->
            <div class="col-lg-4 col-xlg-3 col-md-5">
                <div class="card">
                    <div class="card-body">
                        <center class="mt-4"><img src="../assets/images/logo-store.jpg" class="img-circle"
                                                  width="150"/>
                            <h4 class="card-title mt-2">Venus Shop</h4>
                        </center>
                    </div>
                </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-lg-8 col-xlg-9 col-md-7">
                <div class="card">
                    <!-- Tab panes -->
                    <div class="card-body">
                        <c:if test="${user != null}">
                            <form action="update_user" method="post">
                                <input type="hidden" name="userId" value="${user.userId}">
                                <div class="form-group">
                                    <label class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="email" name="email"
                                               size="20" value="${user.email}" required="required" maxlength="64">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Full Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="fullName"
                                               size="20" value="${user.fullName}" required="required" maxlength="64">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password"
                                               name="checkPassword" size="20" value="${user.password}"
                                               required="required" minlength="6" maxlength="32">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Leave blank if you don't want to change it.</label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">New Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password" name="password"
                                               size="20" value="${user.password}" maxlength="32">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Confirm New Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password"
                                               name="confirmPassword" size="20" value="${user.password}"
                                               maxlength="32">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${user == null}">
                            <form action="create_user" method="post">
                                <div class="form-group">
                                    <label class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="email" name="email"
                                               size="20" value="${user.email}" required="required" maxlength="64">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Full Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="fullName"
                                               size="20" value="${user.fullName}" required="required" maxlength="64">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password" name="password"
                                               size="20" value="${user.password}" required="required" minlength="6"
                                               maxlength="32">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Confirm Password:</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password"
                                               name="confirmPassword" size="20" value="${user.password}"
                                               required="required" minlength="6" maxlength="32">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- Column -->
        </div>
        <!-- Row -->
        <!-- ============================================================== -->
        <!-- End PAge Content -->
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
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../admin/node_modules/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="../admin/node_modules/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slim scrollbar scrollbar JavaScript -->
<script src="../admin/html/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="../admin/html/js/waves.js"></script>
<!--Menu sidebar -->
<script src="../admin/html/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="../admin/html/js/custom.min.js"></script>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/richtext.min.css">

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery.richtext.min.js"></script>
</body>
</html>