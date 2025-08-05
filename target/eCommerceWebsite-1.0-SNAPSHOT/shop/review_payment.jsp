<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/css/style.css">

    <title>Review Payment - Online Store</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="featured-block text-center">
    <div class="container">
        <div class="row">
            <div class="text-center">
                <h1>Vui lòng xem kỹ các thông tin sau </h1>
            </div>
            <div class="col-md-6 text-center">
                <h2>Thông tin thanh toán</h2>
                <div align="center">
                    <table>
                        <tr>
                            <td><b>First Name:</b></td>
                            <td>${payer.firstName}</td>
                        </tr>
                        <tr>
                            <td><b>Last Name:</b></td>
                            <td>${payer.lastName}</td>
                        </tr>
                        <tr>
                            <td><b>Email:</b></td>
                            <td>${payer.email}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <h2 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Thông tin người nhận</h2>
                <div align="center">
                    <table>
                        <tr>
                            <td><b>Họ tên người nhận:</b></td>
                            <td>${recipient.recipientName}</td>
                        </tr>
                        <tr>
                            <td><b>Xã/Phường:</b></td>
                            <td>${recipient.line1}</td>
                        </tr>
                        <tr>
                            <td><b>Quận/Huyện:</b></td>
                            <td>${recipient.line2}</td>
                        </tr>
                        <tr>
                            <td><b>Tỉnh:</b></td>
                            <td>${recipient.city}</td>
                        </tr>
                        <tr>
                            <td><b>Ấp/Đường:</b></td>
                            <td>${recipient.state}</td>
                        </tr>
                        <tr>
                            <td><b>Country Code:</b></td>
                            <td>${recipient.countryCode}</td>
                        </tr>
                        <tr>
                            <td><b>Postal Code:</b></td>
                            <td>${recipient.postalCode}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="divider"></div>
<section class="cart text-center">
    <div class="container">
        <div class="text-center" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
            <h2 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Chi tiết giao dịch</h2>
            <p>${transaction.description}</p>
        </div>
        <div class="row">
            <table class="table table-condensed">
                <thead>
                <tr>
                    <th style="width: 5%">No.</th>
                    <th style="width: 50%">Tên sản phẩm</th>
                    <th style="width: 10%">Số lượng</th>
                    <th style="width: 10%">Giá</th>
                    <th style="width: 25%">Tạm tính</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${transaction.itemList.items}" var="item" varStatus="var">
                    <tr>
                        <td>${var.index + 1}</td>
                        <td>${item.name}</td>
                        <td>${item.quantity}</td>
                        <td>$${item.price}</td>
                        <td>$${item.price * item.quantity}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="right" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                        <p>Tạm tính: $${transaction.amount.details.subtotal}</p>
                        <p>Tax: $${transaction.amount.details.tax}</p>
                        <p>Phí vận chuyển: $${transaction.amount.details.shipping}</p>
                        <p>TỔNG CỘNG: $${transaction.amount.total}</p>
                        <form action="execute_payment" method="post">
                            <input type="hidden" name="paymentId" value="${param.paymentId}"/>
                            <input type="hidden" name="PayerID" value="${param.PayerID}"/>
                            <button type="submit" class="btn btn-primary btn-lg pl-5 pr-5">Thanh toán</button>
                        </form>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>