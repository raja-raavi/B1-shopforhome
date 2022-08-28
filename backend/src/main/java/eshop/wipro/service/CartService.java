package eshop.wipro.service;

import java.util.Collection;

import eshop.wipro.entity.Cart;
import eshop.wipro.entity.ProductInOrder;
import eshop.wipro.entity.User;

public interface CartService {
    Cart getCart(User user);

    void mergeLocalCart(Collection<ProductInOrder> productInOrders, User user);

    void delete(String itemId, User user);

    void checkout(User user);
}
