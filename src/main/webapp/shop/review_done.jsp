<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${loggedCustomer.fullName} Đánh giá</title>

    <%@ include file="common.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<h2 class="products text-center" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">${loggedCustomer.fullName} Review</h2>

<div class="container">
    <div class="row">
        <div class="col-md-6 text-center">
            <div class="product-image mt-3">
                <img class="img-fluid" src="data:image/jpg;base64,${product.base64Image}" alt=""/>
            </div>
        </div>
        <div class="col-md-6 mt-5 mt-md-2 text-center text-md-left">
            <h2 class="mb-3 mt-0">${product.title}</h2>
            <p style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Đánh giá của bạn đã được ghi nhận. Xin cảm ơn!</p>
            <a href="${pageContext.request.contextPath}/" class="signup-image-link">Tiếp tục mua hàng</a>
        </div>
    </div>
</div>
<h2 class="products text-center"></h2>
<%@ include file="footer.jsp" %>
</body>
</html>