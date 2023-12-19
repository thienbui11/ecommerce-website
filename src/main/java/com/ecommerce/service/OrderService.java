package com.ecommerce.service;

import com.ecommerce.model.dao.OrderDAO;
import com.ecommerce.model.dao.ProductDAO;
import com.ecommerce.model.domain.Cart;
import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.OrderDetail;
import com.ecommerce.model.entity.Product;
import com.ecommerce.model.entity.ProductOrder;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.*;

import static com.ecommerce.utility.CommonUtility.*;

public class OrderService {
	private final HttpServletRequest request;
	private final HttpServletResponse response;
	private final OrderDAO orderDAO;

	public OrderService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.orderDAO = new OrderDAO();
	}

	public void listOrder() throws ServletException, IOException {
		listOrder(null);
	}

	public void listOrder(String message) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<ProductOrder> listOrder = orderDAO.listAll();
		request.setAttribute("listOrder", listOrder);

		if (message != null) {
			request.setAttribute("message", message);
		}

		forwardToPage("order_list.jsp", request, response);
	}

	public void viewOrderDetailForAdmin() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int orderId = Integer.parseInt(request.getParameter("id"));
		ProductOrder order = orderDAO.get(orderId);

		if (order != null) {
			request.setAttribute("order", order);
			forwardToPage("order_detail.jsp", request, response);

		} else {
			messageForAdmin(String.format("Could not find order with ID %s.", orderId), request, response);
		}
	}

	public void showCheckoutForm() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		float tax = (float) (cart.getTotalAmount() * 0.1);

		float shippingFee = cart.getTotalQuantity() * 5.0f;

		float total = cart.getTotalAmount() + tax + shippingFee;

		session.setAttribute("tax", tax);
		session.setAttribute("shippingFee", shippingFee);
		session.setAttribute("total", total);

		generateCountryList(request);

		forwardToPage("shop/checkout.jsp", request, response);
	}

	public void placeOrder() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String paymentMethod = request.getParameter("paymentMethod");
		ProductOrder order = readOrderInfo();

		if (paymentMethod.equals("PayPal")) {
			PaymentService paymentService = new PaymentService(request, response);
			request.getSession().setAttribute("orderForPayPal", order);
			paymentService.authorizePayment(order);
		} else {
			placeOrderDirectly(order);
		}
	}

	private void placeOrderDirectly(ProductOrder order) throws ServletException, IOException {
		// Lưu đơn hàng
		saveOrder(order);

		// Trừ số lượng sản phẩm trong kho
		updateStock(order);

		messageForShop("Thank you. Your order has been received. Your product(s) will be delivered within a few days.",
				request, response);
	}

	private void updateStock(ProductOrder order) {
		Map<Product, Integer> orderItems = new HashMap<>();

		// Lấy thông tin sản phẩm và số lượng từ đơn hàng
		for (OrderDetail detail : order.getOrderDetails()) {
			Product product = detail.getProduct();
			int quantityOrdered = detail.getQuantity();

			// Lưu thông tin sản phẩm và số lượng vào map orderItems
			orderItems.put(product, quantityOrdered);
		}

		// Cập nhật số lượng trong kho
		ProductDAO productDAO = new ProductDAO();
		for (Map.Entry<Product, Integer> entry : orderItems.entrySet()) {
			Product product = entry.getKey();
			int quantityOrdered = entry.getValue();

			// Lấy số lượng hiện tại trong kho
			int currentStock = product.getStock();

			// Trừ đi số lượng sản phẩm đã được đặt hàng
			int updatedStock = currentStock - quantityOrdered;
			if (updatedStock < 0) {
				// Xử lý trường hợp kho không đủ hàng
				// Có thể thông báo hoặc xử lý theo yêu cầu của bạn
			} else {
				// Cập nhật số lượng trong kho
				product.setStock(updatedStock);
				productDAO.update(product);
			}
		}
	}

	public Integer placeOrderPayPal(Payment payment) {
		ProductOrder order = (ProductOrder) request.getSession().getAttribute("orderForPayPal");

		ItemList itemList = payment.getTransactions().get(0).getItemList();
		ShippingAddress shippingAddress = itemList.getShippingAddress();
		String shippingPhoneNumber = itemList.getShippingPhoneNumber();

		String recipientName = shippingAddress.getRecipientName();
		String[] names = recipientName.split(" ");

		order.setRecipientFirstName(names[0]);
		order.setRecipientLastName(names[1]);
		order.setRecipientAddressLine1(shippingAddress.getLine1());
		order.setRecipientAddressLine2(shippingAddress.getLine2());
		order.setRecipientCity(shippingAddress.getCity());
		order.setRecipientState(shippingAddress.getState());
		order.setRecipientCountry(shippingAddress.getCountryCode());
		order.setRecipientPhone(shippingPhoneNumber);

		return saveOrder(order);
	}

	private Integer saveOrder(ProductOrder order) {
		ProductOrder savedOrder = orderDAO.create(order);

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		cart.clear();

		return savedOrder.getOrderId();
	}

	private ProductOrder readOrderInfo() throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String recipientFirstName = request.getParameter("recipientFirstName");
		String recipientLastName = request.getParameter("recipientLastName");
		String recipientPhone = request.getParameter("recipientPhone");
		String recipientAddressLine1 = request.getParameter("recipientAddressLine1");
		String recipientAddressLine2 = request.getParameter("recipientAddressLine2");
		String recipientCity = request.getParameter("recipientCity");
		String recipientState = request.getParameter("recipientState");
		String recipientZipCode = request.getParameter("recipientZipCode");
		String recipientCountry = request.getParameter("recipientCountry");
		String paymentMethod = request.getParameter("paymentMethod");

		ProductOrder order = new ProductOrder();
		order.setRecipientFirstName(recipientFirstName);
		order.setRecipientLastName(recipientLastName);
		order.setRecipientPhone(recipientPhone);
		order.setRecipientAddressLine1(recipientAddressLine1);
		order.setRecipientAddressLine2(recipientAddressLine2);
		order.setRecipientCity(recipientCity);
		order.setRecipientState(recipientState);
		order.setRecipientZipCode(recipientZipCode);
		order.setRecipientCountry(recipientCountry);
		order.setPaymentMethod(paymentMethod);

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);

		Cart cart = (Cart) session.getAttribute("cart");
		Map<Product, Integer> items = cart.getItems();

		Iterator<Product> iterator = items.keySet().iterator();
		Set<OrderDetail> orderDetails = new HashSet<>();

		while (iterator.hasNext()) {
			Product product = iterator.next();
			Integer quantity = items.get(product);
			float subtotal = quantity * product.getPrice();

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setProduct(product);
			orderDetail.setProductOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);

			orderDetails.add(orderDetail);
		}

		order.setOrderDetails(orderDetails);

		float tax = (float) session.getAttribute("tax");
		float shippingFee = (float) session.getAttribute("shippingFee");
		float total = (float) session.getAttribute("total");

		order.setSubtotal(cart.getTotalAmount());
		order.setTax(tax);
		order.setShippingFee(shippingFee);
		order.setTotal(total);

		return order;
	}

	private void placeOrderCOD(ProductOrder order) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		saveOrder(order);

		messageForShop("Chúng tôi đã nhận được đơn đặt hàng của bạn. Sản phẩm của bạn sẽ được giao trong vòng vài ngày. Cám ơn đã ủng hộ sản phẩm của chúng tôi",
				request, response);
	}

	public void listOrderByCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		List<ProductOrder> listOrder = orderDAO.listByCustomer(customer.getCustomerId());

		request.setAttribute("listOrder", listOrder);

		forwardToPage("shop/order_list.jsp", request, response);
	}

	public void showOrderDetailForCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");

		ProductOrder order = orderDAO.get(orderId, customer.getCustomerId());
		request.setAttribute("order", order);

		forwardToPage("shop/order_detail.jsp", request, response);
	}

	public void showEditOrderForm() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		ProductOrder order = orderDAO.get(orderId);

		if (order == null) {
			messageForAdmin(String.format("Could not find order with ID %s.", orderId), request, response);
			return;
		}

		HttpSession session = request.getSession();
		Object isPendingProduct = session.getAttribute("NewProductPendingToAddToOrder");

		if (isPendingProduct == null) {
			session.setAttribute("order", order);
		} else {
			session.removeAttribute("NewProductPendingToAddToOrder");
		}

		generateCountryList(request);

		forwardToPage("order_form.jsp", request, response);
	}

	public void showAddProductForm() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ProductDAO productDAO = new ProductDAO();
		List<Product> listProduct = productDAO.listAll();
		request.setAttribute("listProduct", listProduct);

		forwardToPage("add_product_form.jsp", request, response);
	}

	public void addToOrder() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int productId = Integer.parseInt(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.get(productId);

		HttpSession session = request.getSession();
		ProductOrder order = (ProductOrder) session.getAttribute("order");

		float subtotal = quantity * product.getPrice();

		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setProduct(product);
		orderDetail.setQuantity(quantity);
		orderDetail.setSubtotal(subtotal);

		float newTotal = order.getTotal() + subtotal;
		order.setTotal(newTotal);

		order.getOrderDetails().add(orderDetail);

		request.setAttribute("product", product);
		session.setAttribute("NewProductPendingToAddToOrder", true);

		forwardToPage("add_product_result.jsp", request, response);
	}

	public void removeFromOrder() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int productId = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		ProductOrder order = (ProductOrder) session.getAttribute("order");

		Set<OrderDetail> orderDetails = order.getOrderDetails();
		Iterator<OrderDetail> iterator = orderDetails.iterator();

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();

			if (orderDetail.getProduct().getProductId() == productId) {
				float newTotal = order.getTotal() - orderDetail.getSubtotal();
				order.setTotal(newTotal);
				iterator.remove();
			}
		}

		forwardToPage("order_form.jsp", request, response);
	}

	public void updateService() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ProductOrder order = (ProductOrder) session.getAttribute("order");

		String recipientFirstName = request.getParameter("recipientFirstName");
		String recipientLastName = request.getParameter("recipientLastName");
		String recipientPhone = request.getParameter("recipientPhone");
		String recipientAddressLine1 = request.getParameter("recipientAddressLine1");
		String recipientAddressLine2 = request.getParameter("recipientAddressLine2");
		String recipientCity = request.getParameter("recipientCity");
		String recipientState = request.getParameter("recipientState");
		String recipientZipCode = request.getParameter("recipientZipCode");
		String recipientCountry = request.getParameter("recipientCountry");

		float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));
		float tax = Float.parseFloat(request.getParameter("tax"));

		String paymentMethod = request.getParameter("paymentMethod");
		String orderStatus = request.getParameter("orderStatus");

		order.setRecipientFirstName(recipientFirstName);
		order.setRecipientLastName(recipientLastName);
		order.setRecipientPhone(recipientPhone);
		order.setRecipientAddressLine1(recipientAddressLine1);
		order.setRecipientAddressLine2(recipientAddressLine2);
		order.setRecipientCity(recipientCity);
		order.setRecipientState(recipientState);
		order.setRecipientZipCode(recipientZipCode);
		order.setRecipientCountry(recipientCountry);
		order.setShippingFee(shippingFee);
		order.setTax(tax);
		order.setPaymentMethod(paymentMethod);
		order.setStatus(orderStatus);

		String[] arrayProductId = request.getParameterValues("productId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayProductId.length];

		for (int i = 1; i <= arrayQuantity.length; i++) {
			arrayQuantity[i - 1] = request.getParameter("quantity" + i);
		}

		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.clear();
		//DecimalFormat formater = new DecimalFormat("###,###,###");

		float totalAmount = 0f;

		for (int i = 0; i < arrayProductId.length; i++) {
			int productId = Integer.parseInt(arrayProductId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);

			float subtotal = price * quantity;

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setProduct(new Product(productId));
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			orderDetail.setProductOrder(order);

			orderDetails.add(orderDetail);
			totalAmount += subtotal;
		}

		order.setSubtotal(totalAmount);

		totalAmount += shippingFee;
		totalAmount += tax;

		order.setTotal(totalAmount);

		orderDAO.update(order);

		listOrder(String.format("The order %s has been updated successfully.", order.getOrderId()));
	}

	public void deleteOrder() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		ProductOrder order = orderDAO.get(orderId);

		if (order != null) {
			orderDAO.delete(orderId);
			listOrder(String.format("The order ID %s has been deleted.", orderId));

		} else {
			messageForAdmin(
					String.format("Could not find the order with ID %s or it might have been deleted.", orderId),
					request, response);
		}
	}

}
