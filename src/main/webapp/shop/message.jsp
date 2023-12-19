<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>
    <link rel="stylesheet" href="shop/cssloginre/style.css">
    <title>Hoàn tất hóa đơn</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main">
        <!-- Sign up form -->
        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="register-form">
                        <div>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <h3 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">${message}</h3>
                        </div>
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