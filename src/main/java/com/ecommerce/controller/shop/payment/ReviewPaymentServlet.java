package com.ecommerce.controller.shop.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.service.PaymentService;

@WebServlet(name = "ReviewPaymentServlet", value = "/review_payment")
public class ReviewPaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PaymentService paymentService = new PaymentService(request, response);
		paymentService.reviewPayment();
	}

}
