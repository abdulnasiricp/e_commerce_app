// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:e_commerce_app/Provider/CartProvider.dart';
import 'package:e_commerce_app/View/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData;

  Future hitApi() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['products'];
        print(DoneListData);
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    hitApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DoneListData != null
              ? ListView.builder(
                  itemCount: DoneListData!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => ProductDetailScreen(
                              imageUrl: DoneListData![index]['thumbnail'],
                              title: DoneListData![index]['title'],
                              description: DoneListData![index]['description'],
                             
                              price: DoneListData![index]['price']
                            ));
                      },
                      child: Card(child: Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    DoneListData![index]['thumbnail']),
                              ),
                              title: Text(
                                DoneListData![index]['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text(DoneListData![index]['description']),
                              trailing: TextButton.icon(
                                icon: const Icon(Icons.shopping_cart),
                                onPressed: () {
                                  if (value.selectedValue.contains(index)) {
                                    value.removeItem(index);
                                  } else {
                                    value.addItem(index);
                                  }
                                },
                                label: Text(value.selectedValue.contains(index)
                                    ? 'Remove from cart'
                                    : 'Add to Cart'),
                              ));
                        },
                      )),
                    );
                  })
              : const CircularProgressIndicator()),
    );
  }
}
