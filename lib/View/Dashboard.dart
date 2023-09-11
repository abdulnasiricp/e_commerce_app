// ignore_for_file: file_names, missing_required_param

import 'package:e_commerce_app/View/shopping_cart.dart';
import 'package:flutter/material.dart';

import '../Utils/helper_class.dart';
import 'checkout_process.dart';
import 'product_listing.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  var pages = [
    const ProductScreen(),
    ShoppingCartScreen(),
   const  CheckoutPage(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.appbarColor,
        foregroundColor: Utils.appbarForgroundColor,
        automaticallyImplyLeading: false,
        
        
      ),
      body: Container(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Shopping Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout), label: 'CheckOut'),
          
        ],
        currentIndex: currentIndex,
        selectedItemColor: Utils.selectedItemColor,
        type: BottomNavigationBarType.fixed,
        onTap: onItemSelected,
        backgroundColor: Utils.bgColor,
      ),
    );
  }

  void onItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
