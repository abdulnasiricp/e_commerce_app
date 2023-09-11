import 'package:e_commerce_app/Provider/CartProvider.dart';
import 'package:e_commerce_app/Utils/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? price;
 

  const ProductDetailScreen({
    Key? key,
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.description,
   
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Utils.appbarColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Consumer<CartProvider>(builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.imageUrl.toString(),
                  ),
                  Text(
                    widget.title.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.description.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  

                  Text('Price: ${widget.price.toString()}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
