import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends ChangeNotifier {
  int state = 0;

  void increment() {
    state++;
    notifyListeners();
  }
}

final myNotifierProvider = ChangeNotifierProvider<MyNotifier>((ref) {
  return MyNotifier();
});
