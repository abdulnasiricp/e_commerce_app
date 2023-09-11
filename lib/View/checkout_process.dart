// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, unnecessary_null_comparison

import 'dart:convert';

import 'package:e_commerce_app/Provider/CartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class CheckoutPage extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? price;

  const CheckoutPage({
    super.key,
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.description,
  });
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
      
      body:
      Center(
        child: DoneListData!=null?
      
       SingleChildScrollView(
        child: 
        Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

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
            
        )
      ):CupertinoActivityIndicator())
    );
  }
}
