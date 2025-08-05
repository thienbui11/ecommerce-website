<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <title>Thanh toán</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="cart text-center">
    <div class="container">
        <c:if test="${message != null}">
            <div align="center">
                <h4>${message}</h4>
            </div>
        </c:if>

        <c:set var="cart" value="${sessionScope['cart']}"/>

        <c:if test="${cart.totalItems == 0}">
            <h2>There's no items in your cart</h2>
        </c:if>
        <div class="row">
            <div class="col-sm-6 mb-3 mb-m-1 text-md-left">
                <a href=""><i class="fas fa-arrow-left mr-2"></i>Tiếp tục mua hàng</a>
            </div>
            <div class="col-sm-6 text-md-right">
                <a href="view_cart" class="btn btn-primary btn-lg pl-5 pr-5"style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Sửa lại giỏ hàng</a>
            </div>
        </div>
        <c:if test="${cart.totalItems > 0}">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="mt-5 mb-2" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Chi Tiết Đơn Hàng </h2>
                    <table class="table table-condensed">
                        <tr>
                            <th style="width: 5%">No</th>
                            <th style="width: 50%">Sản phẩm</th>
                            <th style="width: 15%">Đơn giá</th>
                            <th style="width: 15%">Số lượng</th>
                            <th style="width: 15%">Tổng cộng</th>
                        </tr>

                        <c:forEach items="${cart.items}" var="item" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-md-3 text-left">
                                            <img src="data:image/jpg;base64,${item.key.base64Image}"
                                                 class="img-fluid" alt="">
                                        </div>
                                        <div class="col-md-9 text-left mt-sm-2">
                                            <h4>${item.key.title}</h4>
                                        </div>
                                    </div>
                                </td>
                                <td>$${item.key.price}</td>
                                <td>${item.value}
                                </td>
                                <td>$${item.value * item.key.price}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="float-right text-right">
                        <h4>${cart.totalQuantity} sản phẩm</h4>
                        <h4>Tổng: $${cart.totalAmount} </h4>
                        <h4>Tax: $${tax} </h4>
                        <h4>Giao hàng: $${shippingFee} </h4>
                        <h3 style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">TỔNG CỘNG: $${total} </h3>
                    </div>
                </div>
            </div>
            <div class="divider"></div>

            <form action="place_order" method="post">
                <div class="row">
                    <div class="col-12 text-center">
                        <h2 class="mt-5 mb-2" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">Thông tin nhận hàng</h2>
                        <div class="text-left">
                            <table align="center">
                                <tr>
                                    <td>Họ và tên lót:</td>
                                    <td><input type="text" style="font-family:nunito;" name="recipientFirstName" value="${loggedCustomer.firstName}"
                                               required="required" maxlength="32"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tên:</td>
                                    <td><input type="text" style="font-family:nunito;" name="recipientLastName" value="${loggedCustomer.lastName}"
                                               required="required" maxlength="32"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại:</td>
                                    <td><input type="number" style="font-family:nunito;" name="recipientPhone" value="${loggedCustomer.phone}"
                                               required="required" maxlength="16"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Xã/Phường :</td>
                                    <td><input type="text" style="font-family:nunito;" name="recipientAddressLine1"
                                               value="${loggedCustomer.addressLine1}"
                                               required="required" maxlength="128"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Quận/Huyện:</td>
                                    <td><input type="text" style="font-family:nunito;" name="recipientAddressLine2"
                                               value="${loggedCustomer.addressLine2}"
                                               required="required" maxlength="128"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tỉnh/Thành Phố:</td>
                                    <td><input type="text" style="font-family:nunito;" name="recipientCity" value="${loggedCustomer.city}"
                                               required="required"
                                               maxlength="32">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ấp:</td>
                                    <td><input type="text" style="font-family:nunito;" name="recipientState" value="${loggedCustomer.state}"
                                               required="required"
                                               maxlength="32">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Zip code:</td>
                                    <td><input type="text" name="recipientZipCode" value="${loggedCustomer.zipCode}"
                                               required="required" maxlength="16"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Country:</td>
                                    <td>
                                        <select name="recipientCountry" class="btn btn-lg btn-white dropdown-toggle">
                                            <c:forEach items="${mapCountries}" var="country">
                                                <option value="${country.value}"
                                                        <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phương thức thanh toán:
                                    </td>
                                    <td style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;">
                                        <select name="paymentMethod" class="btn btn-lg btn-white dropdown-toggle">
                                            <option value="Cash On Delivery" >Trả tiền khi nhận hàng</option>
                                            <option value="PayPal">PayPal hoặc thẻ tín dụng</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="products text-center container">
                        <button class="btn btn-lg btn-outline-primary" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" type="submit">Đặt hàng</button> &nbsp;&nbsp;
                        <a class="btn btn-lg btn-outline-primary" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;" href="${pageContext.request.contextPath}/">Tiếp tục mua hàng</a>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>