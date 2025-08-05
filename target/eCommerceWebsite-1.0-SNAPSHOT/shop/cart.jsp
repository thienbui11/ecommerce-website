<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/css/style.css">

    <script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="shop/js/jquery.validate.min.js"></script>

    <script src="shop/bootstrap/js/bootstrap.min.js"></script>
    <script src="shop/js/tether.min.js"></script>

    <title>Giỏ hàng của bạn</title>
</head>

<body>
<%@ include file="header.jsp" %>

<section class="cart text-center">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 mb-3 mb-m-1 text-md-left">
                <a href=""><i class="fas fa-arrow-left mr-2" ></i>Tiếp tục mua hàng</a>
            </div>
            <%--            <div class="col-sm-6 text-md-right">--%>
            <%--                <a href="checkout" class="btn btn-primary btn-lg pl-5 pr-5">Thanh toán</a>--%>
            <%--            </div>--%>
        </div>

        <c:set var="cart" value="${sessionScope['cart']}"/>

        <div class="row">
            <div class="col-12 text-center">
                <h2 class="mt-5 mb-2" style="font-family:nunito;">GIỎ HÀNG CỦA BẠN</h2>

                <c:if test="${cart.totalItems == 0}">
                    <p class="mb-5" style="font-family:courier,Verdana,helvetica;">Chưa có gì trong giỏ hàng!!</p>
                </c:if>
                <c:if test="${cart.totalItems > 0}">
                    <p class="mb-5" style="font-family: Open Sans, -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;"><span class="primary-color">${cart.totalItems}</span> Sản phẩm trong giỏ hàng</p>
                </c:if>

                <c:if test="${message != null}">
                    <div align="center">
                        <p class="mb-5">${message}</p>
                    </div>
                </c:if>

                <c:if test="${cart.totalItems > 0}">
                    <form action="update_cart" method="post" id="cartForm">
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 50%">Sản Phẩm</th>
                                <th style="width: 10%">Số Lượng</th>
                                <th style="width: 10%">Đơn Giá</th>
                                <th style="width: 10%">Tổng cộng</th>
                                <th style="width: 15%">
                                    <a href="clear_cart" type="button" id="clearCart">Xóa tất cả</a>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${cart.items}" var="item" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td data-th="Product">
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

                                    <td data-th="Quantity">
                                        <input type="hidden" name="productId" value="${item.key.productId}"/>
                                        <input type="number" name="quantity${status.index + 1}" value="${item.value}"
                                               class="form-control text-center">
                                    </td>

                                    <td data-th="Price">$${item.key.price} </td>

                                    <td>$${item.value * item.key.price} </td>

                                    <td class="actions" data-th="">
                                        <div class="text_center">
                                            <button type="submit" class="btn btn-white btn-md mb-2">
                                                <i class="fas fa-sync"></i>
                                            </button>
                                            <a type="button" class="btn btn-white btn-md mb-2"
                                               href="remove_from_cart?product_id=${item.key.productId}"><i
                                                    class="fas fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </c:if>
                <div class="float-right text-right">
                    <h4>Tổng cộng:</h4>
                    <h1>$${cart.totalAmount}</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 mb-3 mb-m-1 text-md-left">
                <a href="${pageContext.request.contextPath}/"><i class="fas fa-arrow-left mr-2"></i> Tiếp tục mua hàng</a>
            </div>
            <div class="col-sm-6 text-md-right">
                <a href="checkout" class="btn btn-primary btn-lg pl-5 pr-5">Thanh Toán</a>
            </div>
        </div>
    </div>

</section>

<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#clearCart").click(function () {
            window.location = 'clear_cart';
        });

        $("#cartForm").validate({
            rules: {
                <c:forEach items="${cart.items}" var="item" varStatus="status">
                quantity${status.index + 1}: {
                    required: true, number: true, min: 1
                }
                </c:forEach>
            },
            messages: {
                <c:forEach items="${cart.items}" var="item" varStatus="status">
                quantity${status.index + 1}: {
                    required: "Please enter quantity.",
                    number: "Must be a number.",
                    min: "Must be greater than 0."
                }
                </c:forEach>
            }
        });
    });
</script>
</html>