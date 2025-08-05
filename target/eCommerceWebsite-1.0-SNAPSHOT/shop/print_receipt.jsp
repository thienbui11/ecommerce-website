<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>In hóa đơn</title>
</head>
<body onload="window.print();">
<div>
    <div>
        <div align="center">
            <h2 style="text-transform:uppercase;">Hóa đơn của bạn</h2>
        </div>
        <div>
            <h2 style="text-transform:uppercase;">Thông tin người bán hàng</h2>
            <div>
                <table>
                    <tr>
                        <td><b>Email: </b></td>
                        <td>sales@onlinestore.com</td>
                    </tr>
                    <tr>
                        <td><b>Phone: </b></td>
                        <td>+1 123 456 789</td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            <h2 style="text-transform:uppercase;">Thông tin người đặt hàng</h2>
            <div>
                <table>
                    <tr>
                        <td><b>Họ và tên lót: </b></td>
                        <td>${payer.firstName}</td>
                    </tr>
                    <tr>
                        <td><b>Tên: </b></td>
                        <td>${payer.lastName}</td>
                    </tr>
                    <tr>
                        <td><b>Email: </b></td>
                        <td>${payer.email}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<div>
    <div>
        <h2 style="text-transform:uppercase;">Chi tiết hóa đơn</h2>
        <p>Người đặt hàng: ${loggedCustomer.fullName}</p>
        <p>${transaction.description}</p>
    </div>
    <div>
        <table>
            <thead>
            <tr>
                <th style="width: 5%">No.</th>
                <th style="width: 50%">Tên</th>
                <th style="width: 10%">Số lượng</th>
                <th style="width: 10%">Giá</th>
                <th style="width: 25%">Tổng</th>
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
                <td colspan="5" align="right">
                    <p>Tạm tính: $${transaction.amount.details.subtotal}</p>
                    <p>Tax: $${transaction.amount.details.tax}</p>
                    <p>Phí vận chuyển: $${transaction.amount.details.shipping}</p>
                    <p>TỔNG CỘNG: $${transaction.amount.total}</p>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
