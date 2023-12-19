package com.ecommerce.model.domain;

import com.ecommerce.model.entity.Product;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	private final Map<Product, Integer> cart = new HashMap<>();

	private final Map<Product, Integer> initialQuantities = new HashMap<>(); // Lưu số lượng ban đầu của sản phẩm

	public void addItem(Product product) {
		if (cart.containsKey(product)) {
			Integer quantity = cart.get(product) + 1;
			cart.put(product, quantity);
		} else {
			cart.put(product, 1);
			initialQuantities.put(product, 1); // Lưu số lượng ban đầu khi thêm sản phẩm vào giỏ hàng
		}
	}

	public int getInitialQuantity(int productId) {
		Product product = new Product(productId);
		if (initialQuantities.containsKey(product)) {
			return initialQuantities.get(product); // Trả về số lượng ban đầu của sản phẩm
		}
		return 0; // Nếu không tìm thấy, trả về 0
	}
	public void removeItem(Product product) {
		cart.remove(product);
	}

	public int getTotalQuantity() {
		int total = 0;

		for (Product next : cart.keySet()) {
			Integer quantity = cart.get(next);
			total += quantity;
		}

		return total;
	}
	public int getAmountByProduct(int productIds) {
		int quantity = 0;
		Product product = new Product(productIds);

		if (cart.containsKey(product)) {
			quantity = cart.get(product);
		}
		return quantity;
	}
	public float getTotalAmount() {
		float total = 0.0f;

		for (Product product : cart.keySet()) {
			Integer quantity = cart.get(product);
			double subTotal = quantity * product.getPrice();
			total += subTotal;
		}

		DecimalFormat decimalFormat = new DecimalFormat("#.000");
		return Float.parseFloat(decimalFormat.format(total));
	}

	public void updateCart(int[] productIds, int[] quantities) {
		for (int i = 0; i < productIds.length; i++) {
			Product key = new Product(productIds[i]);
			Integer value = quantities[i];
			cart.put(key, value);
		}
	}

	public void clear() {
		cart.clear();
	}

	public int getTotalItems() {
		return cart.size();
	}

	public Map<Product, Integer> getItems() {
		return this.cart;
	}
}
