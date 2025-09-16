import 'package:flutter/material.dart';

class NavigationHelper {
  // push to new screen
  static void push(BuildContext context, Widget routeName) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => routeName));
  }

  //replacement of current screen
  static void pushReplacement(BuildContext context, Widget routeName) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => routeName),
    );
  }
}
