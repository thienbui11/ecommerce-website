<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">

    <script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="shop/js/jquery.validate.min.js"></script>

    <title>Chỉnh sửa thông tin</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main" >

        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="signup-form" >
                        <h5 class="form-title">Chỉnh sửa thông tin</h5>

                        <form method="post" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" action="update_profile" class="register-form" id="customerForm" >
                            <div class="form-group">
                                <label><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="firstName" placeholder="Họ và tên lót."
                                       value="${loggedCustomer.firstName}" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="lastName" placeholder="Tên."
                                       value="${loggedCustomer.lastName}" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-email"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="email" name="email" placeholder="Địa Chỉ Email." readonly="readonly"
                                       value="${loggedCustomer.email}"/>
                                <i>Email không thể thay đổi</i>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="number" name="phone" placeholder="Số điện thoại."
                                       value="${loggedCustomer.phone}" required="required" maxlength="16"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="addressLine1" placeholder="Xã/Phường."
                                       value="${loggedCustomer.addressLine1}" required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="addressLine2" placeholder="Quận/Huyện."
                                       value="${loggedCustomer.addressLine2}" required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="city" placeholder="Tỉnh/Thành Phố." value="${loggedCustomer.city}"
                                       required="required" maxlength="32"/>
                            </div>

                            <div class="form-group" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                                <label for="state"><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="state" id="state" placeholder="Ấp/Đường."
                                       value="${loggedCustomer.state}"
                                       required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label for="zipCode"><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Arial, sans-serif;" type="text" name="zipCode" id="zipCode" placeholder="Zip code."
                                       value="${loggedCustomer.zipCode}"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <select name="country">
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}"
                                                <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <i>Để trống nếu bạn không muốn thay đổi mật khẩu.</i>
                            </div>

                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" type="password" name="password" id="password" placeholder="Mật khẩu."/>
                            </div>

                            <div class="form-group">
                                <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" type="password" name="confirmPassword" id="confirmPassword"
                                       placeholder="Xác nhận mật khẩu."/>
                            </div>

                            <div class="form-group form-button">
                                <input style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" type="submit" name="signup" id="signup" class="form-submit" value="XÁC NHẬN"/>
                            </div>

                        </form>
                    </div>

                    <div class="signup-image">
                        <figure>
                            <img src="shop/images/logo-store.png" alt="sing up image">
                        </figure>
                        <a href="view_profile" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" class="signup-image-link">Quay lại</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

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
                    equalTo: "Confirm password does not match."
                }
            }
        });
    });
</script>
<%@ include file="footer.jsp" %>
</body>
</html>