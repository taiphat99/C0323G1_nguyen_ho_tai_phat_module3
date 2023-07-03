package com.productmanagement.repository;

import com.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static final Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Danny", 20000, 1, "Handsome"));
        products.put(2, new Product(2, "Louis", 30000, 2, "Gentlemen"));
        products.put(3, new Product(3, "Bully", 32000, 4, "Cool Boy"));
        products.put(4, new Product(4, "Jackie", 17000, 1, "Enthusiastic"));
        products.put(5, new Product(5, "Chunky", 25000, 6, "Big Man"));
    }

    @Override
    public List<Product> getAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
