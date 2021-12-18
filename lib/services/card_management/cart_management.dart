import 'package:flutter/material.dart';
import 'package:myapp/models/our_product_model.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  List<Product> _products = [];

  double _total_price = 0.0;
  double get total_price => _total_price;
  List<Product> get products => _products;

  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    notifyListeners();
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    try {
      _products.forEach((element) {
        if (element.id == product.id) {
          int index = _products.indexOf(element);
          _products.removeAt(index);
        }
      });
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
