package com.ecommerce.service;

import com.ecommerce.model.dao.CategoryDAO;
import com.ecommerce.model.dao.OrderDAO;
import com.ecommerce.model.dao.ProductDAO;
import com.ecommerce.model.entity.Category;
import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.*;

public class ProductService {
	private final HttpServletRequest request;
	private final HttpServletResponse response;
	private final ProductDAO productDAO;
	private final CategoryDAO categoryDAO;

	public ProductService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		productDAO = new ProductDAO();
		categoryDAO = new CategoryDAO();
	}

	public void listProduct() throws ServletException, IOException {
		listProduct(null);
	}

	public void listProduct(String message) throws ServletException, IOException {
		List<Product> listProducts = productDAO.listAll();

		request.setAttribute("listProducts", listProducts);

		if (message != null) {
			request.setAttribute("message", message);
		}

		forwardToPage("product_list.jsp", message, request, response);
	}

	public void showNewProductForm() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<Category> listCategories = categoryDAO.listAll();

		request.setAttribute("listCategories", listCategories);

		forwardToPage("product_form.jsp", request, response);
	}

	public void createProduct() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");

		Product existProduct = productDAO.findByTitle(title);

		if (existProduct != null) {
			listProduct(String.format("Could not create new product because the title '%s' already exists.", title));
			return;
		}

		Product newProduct = new Product();
		readProductFields(newProduct);

		Product createdProduct = productDAO.create(newProduct);

		if (createdProduct.getProductId() > 0) {
			listProduct("A new product has been created successfully.");
		}
	}

	private void readProductFields(Product product) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		float price = Float.parseFloat(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date publishDate;

		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException exception) {
			exception.printStackTrace();
			throw new ServletException("Error parsing publish date (format is yyyy-MM-dd)");
		}

		product.setTitle(title);
		product.setDescription(description);
		product.setPublishDate(publishDate);

		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		Category category = categoryDAO.get(categoryId);

		product.setCategory(category);
		product.setPrice(price);

		Part part = request.getPart("productImage");

		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageByte = new byte[(int) size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageByte);
			inputStream.close();

			product.setImage(imageByte);
		}
		product.setStock(stock);
		boolean active = Boolean.parseBoolean(request.getParameter("active"));
		product.setActive(active);
	}

	public void editProduct() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer productId = Integer.parseInt(request.getParameter("id"));
		Product product = productDAO.get(productId);

		if (product != null) {
			List<Category> listCategories = categoryDAO.listAll();

			request.setAttribute("product", product);
			request.setAttribute("listCategories", listCategories);

			forwardToPage("product_form.jsp", request, response);

		} else {
			messageForAdmin(
					String.format("Could not find the product with ID %s or it might have been deleted.", productId),
					request, response);
		}
	}

	public void updateProduct() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer productId = Integer.parseInt(request.getParameter("productId"));
		String title = request.getParameter("title");

		Product existProduct = productDAO.get(productId);
		Product productByTitle = productDAO.findByTitle(title);

		if (productByTitle != null && !existProduct.equals(productByTitle)) {
			listProduct("Could not update product because there is another product having same title.");
			return;
		}

		readProductFields(existProduct);

		productDAO.update(existProduct);

		listProduct("The product has been updated successfully.");
	}

	public void deleteProduct() throws ServletException, IOException {
		Integer productId = Integer.parseInt(request.getParameter("id"));
		Product product = productDAO.get(productId);

		if (product == null) {
			messageForAdmin(
					String.format("Could not find the product with ID %s or it might have been deleted.", productId),
					request, response);

		} else {
			if (!product.getReviews().isEmpty()) {
				messageForAdmin(
						String.format("Could not delete the product with ID %s because it has reviews.", productId),
						request, response);

			} else {
				OrderDAO orderDAO = new OrderDAO();
				long countByOrder = orderDAO.countOrderDetailByProduct(productId);

				if (countByOrder > 0) {
					messageForAdmin(String.format(
							"Could not delete the product with ID %s because there are orders associated with it.",
							productId), request, response);

				} else {
					productDAO.delete(productId);
					listProduct("The product has been deleted successfully.");
				}
			}
		}
	}

	public void listAllProduct() throws ServletException, IOException {
		List<Product> listProducts = productDAO.listActive();
		List<Category> listCategories = categoryDAO.listAll();

		String sort = request.getParameter("sort");
		String pageId = request.getParameter("page");

		if (pageId == null) {
			pageId = "1";
		}

		if (Objects.equals(sort, "4.5")) {
			listProducts = productDAO.listRatedProducts(4.5);
		}
		if (Objects.equals(sort, "4.0")) {
			listProducts = productDAO.listRatedProducts(4.0);
		}
		if (Objects.equals(sort, "3.5")) {
			listProducts = productDAO.listRatedProducts(3.5);
		}
		if (Objects.equals(sort, "3.0")) {
			listProducts = productDAO.listRatedProducts(3.0);
		}
		if (Objects.equals(sort, "price_desc")) {
			listProducts = productDAO.listByPriceDesc();
		}
		if (Objects.equals(sort, "price_asc")) {
			listProducts = productDAO.listByPrice();
		}
		if (Objects.equals(sort, "newest")) {
			listProducts = productDAO.listNewProducts();
		}
		if (Objects.equals(sort, "best_selling")) {
			listProducts = productDAO.listBestSellingProducts();
		}
		if (Objects.equals(sort, "most_favored")) {
			listProducts = productDAO.listMostFavoredProducts();
		}

		int numberOfPages = listProducts.size();
		int numberOfProducts = 9;

		if (numberOfPages % numberOfProducts != 0) {
			numberOfPages = numberOfPages / numberOfProducts + 1;
		} else {
			numberOfPages = numberOfPages / numberOfProducts;
		}

		int numEnd = Integer.parseInt(pageId) * numberOfProducts - 1;
		int numBegin = numEnd - numberOfProducts + 1;

		int rating4_5 = productDAO.listRatedProducts(4.5).size();
		int rating4 = productDAO.listRatedProducts(4.0).size();
		int rating3_5 = productDAO.listRatedProducts(3.5).size();
		int rating3 = productDAO.listRatedProducts(3.0).size();

		request.setAttribute("rating4_5", rating4_5);
		request.setAttribute("rating4", rating4);
		request.setAttribute("rating3_5", rating3_5);
		request.setAttribute("rating3", rating3);

		request.setAttribute("listProducts", listProducts);
		request.setAttribute("listCategories", listCategories);

		request.setAttribute("sort", sort);

		request.setAttribute("pageId", pageId);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("numBegin", numBegin);
		request.setAttribute("numEnd", numEnd);

		forwardToPage("shop/product_list.jsp", request, response);
	}

	public void listProductByCategory() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		List<Product> listProducts = productDAO.listByCategory(categoryId);

		String sort = request.getParameter("sort");
		String pageId = request.getParameter("page");
		String rating = request.getParameter("rating");

		if (pageId == null) {
			pageId = "1";
		}

		if (category == null) {
			messageForShop(String.format(
					"Sorry. The category ID %s is not available.<br/><a href='#' type='button' onclick='history.go(-1);'>Click here</a> to go back.",
					categoryId), request, response);
			return;
		}

		if (Objects.equals(rating, "4.5")) {
			listProducts = productDAO.listRatedProducts(categoryId, 4.5);
		}
		if (Objects.equals(rating, "4.0")) {
			listProducts = productDAO.listRatedProducts(categoryId, 4.0);
		}
		if (Objects.equals(rating, "3.5")) {
			listProducts = productDAO.listRatedProducts(categoryId, 3.5);
		}
		if (Objects.equals(rating, "3.0")) {
			listProducts = productDAO.listRatedProducts(categoryId, 3.0);
		}
		if (Objects.equals(sort, "price_desc")) {
			listProducts = productDAO.listByPriceDesc(categoryId);
		}
		if (Objects.equals(sort, "price_asc")) {
			listProducts = productDAO.listByPrice(categoryId);
		}
		if (Objects.equals(sort, "newest")) {
			listProducts = productDAO.listNewProducts(categoryId);
		}
		if (Objects.equals(sort, "best_selling")) {
			listProducts = productDAO.listBestSellingProducts(categoryId);
		}
		if (Objects.equals(sort, "most_favored")) {
			listProducts = productDAO.listMostFavoredProducts(categoryId);
		}

		List<Category> listCategories = categoryDAO.listAll();

		int numberOfPages = listProducts.size();
		int numberOfProducts = 9;

		if (numberOfPages % numberOfProducts != 0) {
			numberOfPages = numberOfPages / numberOfProducts + 1;
		} else {
			numberOfPages = numberOfPages / numberOfProducts;
		}

		int numEnd = Integer.parseInt(pageId) * numberOfProducts - 1;
		int numBegin = numEnd - numberOfProducts + 1;

		int rating4_5 = productDAO.listRatedProducts(categoryId, 4.5).size();
		int rating4 = productDAO.listRatedProducts(categoryId, 4.0).size();
		int rating3_5 = productDAO.listRatedProducts(categoryId, 3.5).size();
		int rating3 = productDAO.listRatedProducts(categoryId, 3.0).size();

		request.setAttribute("rating4_5", rating4_5);
		request.setAttribute("rating4", rating4);
		request.setAttribute("rating3_5", rating3_5);
		request.setAttribute("rating3", rating3);

		request.setAttribute("listProducts", listProducts);
		request.setAttribute("listCategories", listCategories);
		request.setAttribute("category", category);

		request.setAttribute("sort", sort);
		request.setAttribute("rating", rating);

		request.setAttribute("pageId", pageId);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("numBegin", numBegin);
		request.setAttribute("numEnd", numEnd);

		forwardToPage("shop/product_list_by_category.jsp", request, response);
	}

	public void viewProductDetail() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer productId = Integer.parseInt(request.getParameter("id"));
		Product product = productDAO.get(productId);

		if (product != null && product.isActive()) {
			Integer categoryId = product.getCategory().getCategoryId();
			List<Product> listProducts = productDAO.listByCategory(categoryId);
			Collections.shuffle(listProducts);

			request.setAttribute("listProducts", listProducts);
			request.setAttribute("product", product);

			Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
			if (customer != null) {
				List<Product> listOrderedProducts = productDAO.listOrderedProductsByCustomer(customer.getCustomerId());

				if (listOrderedProducts.contains(product)){
					request.setAttribute("unlockReview", true);
				}
			}

			forwardToPage("shop/product_detail.jsp", request, response);

		} else {
			messageForShop(String.format(
					"Sorry. The product with ID %s is not available.<br/><a href='#' type='button' onclick='history.go(-1);'>Click here</a> to go back.",
					productId), request, response);
		}
	}

	public void search() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		List<Product> result;

		if (keyword.equals("")) {
			result = productDAO.listActive();
		} else {
			result = productDAO.search(keyword);
		}

		if (result.size() == 0) {
			request.setAttribute("message", "Found no matching product(s).");
		}

		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);

		forwardToPage("shop/search.jsp", request, response);
	}

}
