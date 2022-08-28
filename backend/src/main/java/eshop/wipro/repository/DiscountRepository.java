package eshop.wipro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import eshop.wipro.entity.Discount;

public interface DiscountRepository extends JpaRepository<Discount, String> {

}
