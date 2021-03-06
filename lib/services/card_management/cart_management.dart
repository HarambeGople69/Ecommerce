import 'package:flutter/material.dart';
import 'package:myapp/models/our_product_model.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  List<Product> _products = [];

  double _total_price = 0.0;
  double get total_price => _total_price;
  List<Product> get products => _products;

  void addCounter(Product product) {
    int index = -5;
    _products.forEach((element) {
      if (element.id == product.id) {
        index = _products.indexOf(element);
      }
    });
    if (index == -5) {
      int? price;

      price = int.parse(product.price!.split("\$")[1]);
      _total_price = _total_price + price * 100;
      _counter++;
      notifyListeners();
      addProduct(product);
      OurToast().showSuccessToast("Product added to cart");
    }
  }

  void removeCounter(Product product) {
    int index = -5;
    _products.forEach((element) {
      if (element.id == product.id) {
        index = _products.indexOf(element);
      }
    });
    if (index == -5) {
    } else {
      int? items;
      items = product.number ?? 1;
      int? price;

      price = int.parse(product.price!.split("\$")[1]);
      _total_price = _total_price - price * 100 * items;
      _counter--;
      notifyListeners();
      removeProduct(product);
      OurToast().showErrorToast("Product removed from cart");
    }
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

  updateProduct(Product product, int number, bool added) {
    print("upadteProduct ==============");
    int index = -5;
    _products.forEach((element) {
      if (element.id == product.id) {
        index = _products.indexOf(element);
      }
    });
    if (index == -5) {
    } else {
      if (added == true) {
        int? price;

        price = int.parse(product.price!.split("\$")[1]);
        _total_price = _total_price + price * 100;
      } else {
        int? price;

        price = int.parse(product.price!.split("\$")[1]);
        _total_price = _total_price - price * 100;
      }
      var a = _products[index].toJson();
      a.update("number", (value) => number);
      removeProduct(product);
      Product newProduct = Product.fromJson(a);
      _products.insert(index, newProduct);
      notifyListeners();
    }
  }
}
