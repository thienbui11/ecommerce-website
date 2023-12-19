<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">
    
    <title>Thông tin khách hàng</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center " >
    <div class="main">
        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="signup-form" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                        <h6 class="form-title">Chào mừng ${loggedCustomer.fullName}</h6>

                        <table class="form-group" style="border: 0">
                            <tr>
                                <td><b>Địa chỉ Email:</b></td>
                                <td>${loggedCustomer.email}</td>
                            </tr>
                            <tr>
                                <td><b>Họ và tên lót:</b></td>
                                <td>${loggedCustomer.firstName}</td>
                            </tr>
                            <tr>
                                <td><b>Tên:</b></td>
                                <td>${loggedCustomer.lastName}</td>
                            </tr>
                            <tr>
                                <td><b>Số điện thoại:</b></td>
                                <td>${loggedCustomer.phone}</td>
                            </tr>
                            <tr>
                                <td><b>Xã/Phường:</b></td>
                                <td>${loggedCustomer.addressLine1}</td>
                            </tr>
                            <tr>
                                <td><b>Quận/Huyện:</b></td>
                                <td>${loggedCustomer.addressLine2}</td>
                            </tr>
                            <tr>
                                <td><b>Tỉnh/Thành Phố:</b></td>
                                <td>${loggedCustomer.city}</td>
                            </tr>
                            <tr>
                                <td><b>Ấp/Đường:</b></td>
                                <td>${loggedCustomer.state}</td>
                            </tr>
                            <tr>
                                <td><b>Zip code:</b></td>
                                <td>${loggedCustomer.zipCode}</td>
                            </tr>
                            <tr>
                                <td><b>Country:</b></td>
                                <td>${loggedCustomer.countryName}</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><a href="edit_profile">Chỉnh sửa thông tin cá nhân</a></td>
                            </tr>
                        </table>
                    </div>

                    <div class="signup-image" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                        <figure>
                            <img src="shop/images/logo-store.png" alt="">
                        </figure>
                        <a href="${pageContext.request.contextPath}/">Tiếp tục mua hàng</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>