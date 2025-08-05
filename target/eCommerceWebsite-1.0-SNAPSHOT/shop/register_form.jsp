<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">

    <title>Đăng ký tài khoản</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main">
        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Đăng ký</h2>

                        <form method="post" action="register_customer" class="register-form" id="customerForm">
                            <div class="form-group" >
                                <label><i
                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                    type="text" name="firstName" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    placeholder="Họ và tên lót" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i
                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                    type="text" name="lastName" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    placeholder="Tên" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-email"></i></label> <input
                                    type="email" name="email" placeholder="Email." required="required" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label> <input
                                    type="password" name="password" id="password" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    placeholder="Mật khẩu."/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="confirmPassword" id="confirmPassword" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                       placeholder="Xác nhận mật khẩu."/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="phone" placeholder="Số điện thoại." required="required" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    maxlength="16"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="addressLine1" placeholder="Xã/Phường" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="addressLine2" placeholder="Quận/Huyện" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    type="text" name="city" placeholder="Tỉnh/Thành phố" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    type="text" name="state" placeholder="Ấp/Đường" required="required"
                                    maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                    type="text" name="zipCode" placeholder="Zip code" required="required"
                                    maxlength="16"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label>
                                <select name="country">
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}"
                                                <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term"
                                       class="agree-term"/> <label for="agree-term" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"
                                                                   class="label-agree-term"><span><span></span></span>Tôi đồng ý tất cả điều khoản trong <a href="#" class="term-service">Terms
                                    of service</a></label>
                            </div>

                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup"
                                       class="form-submit" value="Register"/>
                            </div>

                        </form>
                    </div>

                    <div class="signup-image">
                        <figure>
                            <img src="shop/images/logo-store.png" alt="sing up image">
                        </figure>
                        <a href="login" class="signup-image-link" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Tôi đã có tài khoản</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

<%@ include file="footer.jsp" %>

<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="shop/js/jquery.validate.min.js"></script>
<script src="shop/js/tether.min.js"></script>
<script src="shop/js/popper.min.js"></script>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#customerForm").validate({
            rules: {
                confirmPassword: {
                    equalTo: "#password"
                }
            },

            messages: {
                confirmPassword: {
                    equalTo: "Confirm password does not match your password."
                }
            }
        });
    });
</script>
</html>