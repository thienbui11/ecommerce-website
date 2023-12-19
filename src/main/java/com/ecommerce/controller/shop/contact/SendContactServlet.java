package com.ecommerce.controller.shop.contact;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.service.ContactService;

@WebServlet(name = "SendContactServlet", value = "/send_contact")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 100, // 100MB
		maxRequestSize = 1024 * 1024 * 500) // 500MB
public class SendContactServlet extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ContactService contactService = new ContactService(request, response);
		contactService.sendContact();
	}

}
