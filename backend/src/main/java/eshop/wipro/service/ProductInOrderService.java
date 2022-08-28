package eshop.wipro.service;

import eshop.wipro.entity.ProductInOrder;
import eshop.wipro.entity.User;


public interface ProductInOrderService {
    void update(String itemId, Integer quantity, User user);
    ProductInOrder findOne(String itemId, User user);
}
