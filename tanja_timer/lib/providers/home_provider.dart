import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  void setTime(text) {
    text = _controller.text;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
