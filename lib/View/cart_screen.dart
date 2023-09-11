// import 'package:flutter/material.dart';

// import 'shopping_card.dart';

// class CartScreen extends StatelessWidget {
//   final Cart cart;

//   CartScreen({required this.cart});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.items.length,
//               itemBuilder: (context, index) {
//                 var cartItem = cart.items[index];
//                 return CartItemTile(cartItem: cartItem);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Total Amount: \$${cart.totalAmount.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }