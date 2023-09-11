
// ignore_for_file: no_leading_underscores_for_local_identifiers

class ProductModel {
  List<Products>? products;
  

  ProductModel({this.products, });

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
   
    return _data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products({this.id, this.title, this.description, this.price, this.discountPercentage, this.rating, this.stock, this.brand, this.category, this.thumbnail, this.images});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["discountPercentage"] is double) {
      discountPercentage = json["discountPercentage"];
    }
    if(json["rating"] is double) {
      rating = json["rating"];
    }
    if(json["stock"] is int) {
      stock = json["stock"];
    }
    if(json["brand"] is String) {
      brand = json["brand"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["price"] = price;
    _data["discountPercentage"] = discountPercentage;
    _data["rating"] = rating;
    _data["stock"] = stock;
    _data["brand"] = brand;
    _data["category"] = category;
    _data["thumbnail"] = thumbnail;
    if(images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}