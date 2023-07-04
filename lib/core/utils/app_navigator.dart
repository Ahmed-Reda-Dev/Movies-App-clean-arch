import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, Widget goTo) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => goTo));
  }
}
