import 'package:flutter/material.dart';

class Appnav {
  static push(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }

  static pushReplacemend(BuildContext context, Widget page) {
    return Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }

  static pushAndRemoveUntil(context, Widget page) {
    return Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (c) => page), (route) => false);
  }
}
