package com.ispan.eeit64.service;

import java.util.Comparator;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.CategoryRepository;
import java.util.Optional;
import java.util.Set;
import java.util.HashSet;


@Service
public class ProductService {
    private final DishRepository dishRepository;
    private final CategoryRepository categoryRepository;

    public ProductService(DishRepository dishRepository, CategoryRepository categoryRepository) {
        this.dishRepository = dishRepository;
        this.categoryRepository = categoryRepository;
    }

    public Page<DishBean> findAllProducts(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return dishRepository.findAll(pageable);
    }

    public  List<DishBean> resortProductsByColumn(String sortColumn, String sortDirection) {
        List<DishBean> allProducts = dishRepository.findAll();

        switch (sortColumn) {
            case "餐點編號":
                if (sortDirection.equals("asc")) {
                    allProducts.sort(Comparator.comparing(DishBean::getId));
                } else {
                    allProducts.sort(Comparator.comparing(DishBean::getId).reversed());
                }
                break;

            case "餐點名稱":
                if (sortDirection.equals("asc")) {
                    allProducts.sort(Comparator.comparing(DishBean::getName));
                } else {
                    allProducts.sort(Comparator.comparing(DishBean::getName).reversed());
                }
                break;

            // Add more cases for other columns

            default:
                allProducts.sort(Comparator.comparing(DishBean::getId));
                break;
        }

        return allProducts;
    }

    public List<CategoryBean> getAllCategories() {
        return categoryRepository.findAll();
    }

    public Set<DishBean> findDishByCategoryId(Integer categoryId) {
        Optional<CategoryBean> categoryOptional = categoryRepository.findById(categoryId);
        if (categoryOptional.isPresent()) {
            CategoryBean category = categoryOptional.get();
            return category.getDishBean();
        } else {
            return new HashSet<>();
        }
    }

    public void deleteDishById(Integer dishId) {
        dishRepository.deleteById(dishId);
    }

	public static Page<DishBean> findAllWithPagination(int i, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}
}
