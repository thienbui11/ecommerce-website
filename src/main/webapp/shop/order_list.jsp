<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>
    <link rel="stylesheet" href="shop/css/style.css">
    <title>${loggedCustomer.fullName} - Lịch sử đơn hàng</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="cart text-center">
    <div class="container" >
        <c:if test="${fn:length(listOrder) == 0}">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="mt-5 mb-2" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Bạn chưa đặt bất kỳ đơn hàng nào</h2>
                </div>
            </div>
        </c:if >
        <c:if test="${fn:length(listOrder) > 0}">
            <h2 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" class="mt-5 mb-2">${loggedCustomer.fullName} - Lịch sử đơn hàng</h2>
            <table class="table table-condensed">
                <thead>
                <tr>
                    <th style="width: 5%">STT</th>
                    <th style="width: 10%">Mã đơn hàng</th>
                    <th style="width: 10%">Số lượng</th>
                    <th style="width: 15%">Tổng tiền</th>
                    <th style="width: 30%">Ngày đặt hàng</th>
                    <th style="width: 15%">Tình trạng</th>
                    <th style="width: 15%">Chi tiết</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${listOrder}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${order.orderId}</td>
                        <td>${order.productCopies}</td>
                        <td data-th="Price">$${order.total}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td><a href="show_order_detail?id=${order.orderId}">Xem chi tiết</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>