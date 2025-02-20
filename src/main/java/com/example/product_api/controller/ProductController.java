package com.example.product_api.controller;

import com.example.product_api.model.Product;
import com.example.product_api.service.ProductService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/category/{categoryId}")
    public List<Product> getProductsByCategory(@PathVariable Long categoryId) {
        return productService.getProductsByCategory(categoryId);
    }

    @GetMapping("/top-selling")
    public List<Product> getTop10BestSellingProducts() {
        return productService.getTop10BestSellingProducts();
    }

    @GetMapping("/recent")
    public List<Product> getProductsCreatedLast7Days() {
        return productService.getProductsCreatedLast7Days();
    }
}

