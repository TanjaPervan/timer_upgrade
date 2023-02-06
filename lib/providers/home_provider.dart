import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  String getMinute() {
    return _controller.text;
  }

  void clear() {
    _controller.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
