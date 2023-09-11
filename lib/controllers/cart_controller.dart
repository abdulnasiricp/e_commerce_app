import 'package:get/get.dart';

import '../View/product_details.dart';

class CartConntroller extends GetxController{
  final _products={}.obs;
  void addProduct(ProductDetailScreen product){
    if (_products.containsKey(product)) {
      
      _products[product] +=1;

    }else{
      _products[product]=1;
    }
  }
}