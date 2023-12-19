package com.ecommerce.service;

import com.ecommerce.model.dao.ProductDAO;
import com.ecommerce.model.domain.Cart;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;

import static com.ecommerce.utility.CommonUtility.*;

public class CartService {

	private final HttpServletRequest request;
	private final HttpServletResponse response;

	public CartService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void viewCart() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Object cartObject = request.getSession().getAttribute("cart");

		if (cartObject == null) {
			Cart cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		forwardToPage("shop/cart.jsp", request, response);
	}

	public void addToCart() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer productId = Integer.parseInt(request.getParameter("product_id"));
		int quantityToAdd = 1; // Số lượng mặc định để thêm vào giỏ hàng

		Object cartObject = request.getSession().getAttribute("cart");

		Cart cart;

		if (cartObject instanceof Cart) {
			cart = (Cart) cartObject;
		} else {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.get(productId);

		// Check if there is stock available for the product
		if (product.getStock() > 0) {
			// Check if the quantity to add is within available stock
			if (quantityToAdd <= product.getStock()) {
				// If there is stock and quantity to add is valid, add the item to the cart
				cart.addItem(product); // Thêm sản phẩm vào giỏ hàng
			} else {
				// If quantity to add exceeds stock, show error message
				messageOutOfStock("Sản phẩm đã hết hàng, quý khách vui lòng chọn sản phẩm khác!!",
						request, response);
//				String productPage = request.getContextPath().concat("/view_product?product_id=" + productId);
//				response.sendRedirect(productPage);
				return; // Stop further execution of the method
			}
		} else {
			messageOutOfStock("Sản phẩm đã hết hàng, quý khách vui lòng chọn sản phẩm khác!!",
					request, response);
//			String productPage = request.getContextPath().concat("/view_product?product_id=" + productId);
//			response.sendRedirect(productPage);
			return; // Stop further execution of the method
		}

		// Redirect to the cart page
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}



	public void updateCart() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String[] arrayProductIds = request.getParameterValues("productId");
		String[] arrayQuantities = new String[arrayProductIds.length];

		for (int i = 1; i <= arrayQuantities.length; i++) {
			String aQuantity = request.getParameter("quantity" + i);
			arrayQuantities[i - 1] = aQuantity;
		}

		int[] productIds = Arrays.stream(arrayProductIds).mapToInt(Integer::parseInt).toArray();
		int[] quantities = Arrays.stream(arrayQuantities).mapToInt(Integer::parseInt).toArray();

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		ProductDAO productDAO = new ProductDAO();
		boolean allProductsAvailable = true;

		// Check if there is sufficient stock for each product
		for (int i = 0; i < productIds.length; i++) {
			Product product = productDAO.get(productIds[i]);

			if (product.getStock() < quantities[i]) {
				// If there is not enough stock, set the flag to false and break out of the loop
				allProductsAvailable = false;
				break;
			}
		}

		if (allProductsAvailable) {
			// If there is sufficient stock for all products, update the cart
			cart.updateCart(productIds, quantities);

			// Update the stock in the database for each product
//			for (int i = 0; i < productIds.length; i++) {
//				Product product = productDAO.get(productIds[i]);
//				product.setStock(product.getStock() - quantities[i]);
//				productDAO.update(product);
//			}

			// Redirect to the cart page
			String cartPage = request.getContextPath().concat("/view_cart");
			response.sendRedirect(cartPage);
		} else {
			String errorMessage = "Số lượng hàng đặt quá số lượng hàng đang có";
			request.setAttribute("errorMessage", errorMessage);
			String cartPageWithError = request.getContextPath().concat("/view_cart?error=" + URLEncoder.encode(errorMessage, "UTF-8"));
			response.sendRedirect(cartPageWithError);
		}
	}



	public void removeFromCart() throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer productId = Integer.parseInt(request.getParameter("product_id"));

		Object cartObject = request.getSession().getAttribute("cart");

		Cart cart = (Cart) cartObject;

		// Lấy số lượng sản phẩm khi thêm vào giỏ hàng từ giỏ hàng
		int initialQuantityInCart = cart.getInitialQuantity(productId);

		// Xóa sản phẩm khỏi giỏ hàng
		Product removedProduct = new Product(productId);
		cart.removeItem(removedProduct);

		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.get(productId);

		// Khôi phục số lượng hàng ban đầu trong kho khi xóa đơn hàng
		product.setStock(product.getStock() + initialQuantityInCart);
		productDAO.update(product);

		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}




	public void clearCart() throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		cart.clear();

		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
