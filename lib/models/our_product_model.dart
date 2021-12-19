// ignore_for_file: deprecated_member_use

class ProductModel {
  String? status;
  int? results;
  Data? data;
  String? message;

  ProductModel({this.status, this.results, this.data, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Product>? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product?.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? number = 1;
  int? id;
  String? name;
  String? image;
  String? price;
  int? stock;
  int? createDate;
  List<String>? category;

  Product(
      {this.number,
      this.id,
      this.name,
      this.image,
      this.price,
      this.stock,
      this.createDate,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    stock = json['stock'];
    createDate = json['createDate'];
    category = json['category'].cast<String>();
    number = json["number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['createDate'] = this.createDate;
    data['category'] = this.category;
    data["number"] = null;
    return data;
  }
}
