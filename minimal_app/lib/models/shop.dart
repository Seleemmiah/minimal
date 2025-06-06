import 'package:flutter/material.dart';
import 'package:minimal_app/models/products.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: 'Product 1',
      price: 20.33,
      description: 'item description...',
      imagePath: 'assets/watch.JPG',
    ),

    // product 2
    Product(
      name: 'Product 2',
      price: 19.33,
      description: 'item description...',
      imagePath: 'assets/hoodie.JPG',
    ),

    // product 3
    Product(
      name: 'Product 3',
      price: 18.33,
      description: 'item description...',
      imagePath: 'assets/shoe.JPG',
    ),

    // product 4
    Product(
      name: 'Product 4',
      price: 15.33,
      description: 'item description...',
      imagePath: 'assets/glass.JPG',
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // addd item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
