package com.productmanagement.service;

import com.productmanagement.model.Product;
import com.productmanagement.repository.IProductRepository;
import com.productmanagement.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private final IProductRepository ProductRepository = new ProductRepository();
    @Override
    public List<Product> getAll() {
        return ProductRepository.getAll();
    }

    @Override
    public void save(Product product) {
        ProductRepository.save(product);}

    @Override
    public Product findById(int id) {
        return ProductRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        ProductRepository.update(id,product);
    }

    @Override
    public void remove(int id) {
        ProductRepository.remove(id);
    }
}
