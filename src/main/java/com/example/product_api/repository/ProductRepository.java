package com.example.product_api.repository;


import com.example.product_api.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("SELECT p FROM Product p ORDER BY p.quantitySold DESC LIMIT 10")
    List<Product> findTop10BestSellingProducts();

    @Query("SELECT p FROM Product p WHERE p.createdAt >= :sevenDaysAgo")
    List<Product> findProductsCreatedWithinLast7Days(LocalDateTime sevenDaysAgo);

    List<Product> findByCategoryId(Long categoryId);
}

