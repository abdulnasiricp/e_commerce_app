// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:e_commerce_app/Provider/CartProvider.dart';
import 'package:e_commerce_app/View/checkout_process.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ShoppingCartScreen extends StatefulWidget {
 
  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
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
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Center(
        child: DoneListData != null
            ? ListView.builder(
                itemCount: provider.selectedValue.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Consumer<CartProvider>(
                        builder: (context, value, child) {
                      return ListTile(
                        onTap: (){
                          Get.to(()=>CheckoutPage(imageUrl: DoneListData?[index]['thumbnail'] ,title:DoneListData?[index]['title'] , price: DoneListData?[index]['price'].toString(), description: DoneListData?[index]['description'] ));
                        },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                DoneListData?[index]['thumbnail'] ?? ""),
                          ),
                          title: Text(
                            DoneListData?[index]['title'] ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              Text(DoneListData?[index]['description'] ?? ""),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              if (value.selectedValue.contains(index)) {
                                value.removeItem(index);
                              }
                            },
                          ));
                    }),
                  );
                })
            : const CircularProgressIndicator(),
      ),
    );
  }
}
