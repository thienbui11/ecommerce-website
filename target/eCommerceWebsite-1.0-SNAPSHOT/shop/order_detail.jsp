<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>
    <link rel="stylesheet" href="shop/css/style.css">
    <title>${loggedCustomer.fullName} - Chi tiết đặt hàng</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="featured-block text-center">
    <div class="container">
        <c:if test="${order == null}">
            <div class="row">
                <div class="col-12 text-center" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                    <h2 class="mt-5 mb-2">Bạn không có quyền xem sản phẩm này</h2>
                </div>
            </div>
        </c:if>
        <c:if test="${order != null}">
            <div class="row">
                <div class="col-md-6 text-center">
                    <h2 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Thông tin đơn hàng</h2>
                    <div align="center">
                        <table>
                            <tr>
                                <td><b>Người đặt hàng: </b></td>
                                <td>${order.customer.fullName}</td>
                            </tr>
                            <tr>
                                <td><b>Tình trạng đơn hàng: </b></td>
                                <td>${order.status}</td>
                            </tr>
                            <tr>
                                <td><b>Ngày đặt hàng: </b></td>
                                <td>${order.orderDate}</td>
                            </tr>
                            <tr>
                                <td><b>Phương thức thanh toán: </b></td>
                                <td>${order.paymentMethod}</td>
                            </tr>
                            <tr>
                                <td><b>Số lượng sản phẩm: </b></td>
                                <td>${order.productCopies}</td>
                            </tr>
                            <tr>
                                <td><b>Tổng cộng: </b></td>
                                <td>$${order.total}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6 text-center">
                    <h2 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Thông tin người nhận</h2>
                    <div align="center">
                        <table>
                            <tr>
                                <td><b>Họ và tên: </b></td>
                                <td>${order.recipientFullName}</td>
                            </tr>
                            <tr>
                                <td><b>Số điện thoại: </b></td>
                                <td>${order.recipientPhone}</td>
                            </tr>
                            <tr>
                                <td><b>Xã/Phường: </b></td>
                                <td>${order.recipientAddressLine1}</td>
                            </tr>
                            <tr>
                                <td><b>Quận/Huyện: </b></td>
                                <td>${order.recipientAddressLine2}</td>
                            </tr>
                            <tr>
                                <td><b>Tỉnh: </b></td>
                                <td>${order.recipientCity}</td>
                            </tr>
                            <tr>
                                <td><b>Ấp/Đường: </b></td>
                                <td>${order.recipientState}</td>
                            </tr>
                            <tr>
                                <td><b>Country: </b></td>
                                <td>${order.recipientCountryName}</td>
                            </tr>
                            <tr>
                                <td><b>Số nhà: </b></td>
                                <td>${order.recipientZipCode}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</section>
<div class="divider"></div>
<section class="cart text-center">
    <c:if test="${order != null}">
        <div class="container" >
            <div class="text-center">
                <h2 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Những sản phẩm đã đặt</h2>
            </div>
            <div class="row">
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th style="width: 5%">STT</th>
                        <th style="width: 50%">Tên sản phẩm</th>
                        <th style="width: 10%">Đơn giá</th>
                        <th style="width: 10%">Số lượng</th>
                        <th style="width: 10%">Tổng</th>
                        <th style="width: 15%">Đánh giá</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td data-th="Product">
                                <div class="row">
                                    <div class="col-md-3 text-left">
                                        <img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.product.base64Image}" width="48" height="64" alt=""/>
                                    </div>
                                    <div class="col-md-9 text-left mt-sm-2">
                                        <a href="view_product?id=${orderDetail.product.productId}"><h4>${orderDetail.product.title}</h4></a>
                                    </div>
                                </div>
                            </td>
                            <td>$${orderDetail.product.price}</td>
                            <td>${orderDetail.quantity}</td>
                            <td>$${orderDetail.subtotal}</td>
                            <th><a href="write_review?product_id=${orderDetail.product.productId}">Viết đánh giá</a></th>
                        </tr>
                    </c:forEach>
                    <tr style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                        <td colspan="6" align="right">
                            <p>Tạm tính : $${order.subtotal}</p>
                            <p>Tax: $${order.tax}</p>
                            <p>Phí vận chuyển: $${order.shippingFee}</p>
                            <p>TỔNG CỘNG: $${order.total}</p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>