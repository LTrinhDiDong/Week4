package com.example.product_api.service;


import com.example.product_api.model.Product;
import com.example.product_api.repository.ProductRepository;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getProductsByCategory(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    public List<Product> getTop10BestSellingProducts() {
        return productRepository.findTop10BestSellingProducts();
    }

    public List<Product> getProductsCreatedLast7Days() {
        LocalDateTime sevenDaysAgo = LocalDateTime.now().minusDays(7);
        return productRepository.findProductsCreatedWithinLast7Days(sevenDaysAgo);
    }
}
