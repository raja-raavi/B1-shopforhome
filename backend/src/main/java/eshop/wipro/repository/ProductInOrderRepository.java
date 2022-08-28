package eshop.wipro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import eshop.wipro.entity.ProductInOrder;


public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long> {

}
