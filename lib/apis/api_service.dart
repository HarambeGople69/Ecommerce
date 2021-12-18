import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/our_product_model.dart';

class APIservice {
  fetchdata(String catagory) async {
    try {
      List<Product> productList = [];
      String url = "https://electronic-ecommerce.herokuapp.com/api/v1/product";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        ProductModel productModel =
            ProductModel.fromJson(jsonDecode(response.body));
        productModel.data!.product!.forEach((element) {
          if (catagory == "All") {
            productList.add(
              Product.fromJson(
                element.toJson(),
              ),
            );
          } else if (element.category!.contains(catagory.toLowerCase())) {
            print("================");
            print(element.name);
            // setState(() {
            productList.add(
              Product.fromJson(
                element.toJson(),
              ),
            );
          }
        });
        print("============In API Service ==========");
        print(productList);
        return productList;
      } else {
        print("Error ====================");
      }
    } catch (e) {}
  }
}
