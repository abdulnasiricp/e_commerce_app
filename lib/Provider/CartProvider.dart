// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<int> _selectedItem = [];
  List<int> get selectedValue => _selectedItem;

  void addItem(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItem.remove(value);
    notifyListeners();
  }
}
