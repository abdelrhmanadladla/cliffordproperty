import 'package:flutter/material.dart';

mixin Nav_Helper {
  void jump(context, Widget to,
      {bool replace = false, bool replaceUntil = false}) {
    final route = MaterialPageRoute(builder: (context) => to);
    if (replace) {
      Navigator.pushReplacement(context, route);
    } else if (replaceUntil) {
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else {
      Navigator.push(context, route);
    }
  }
}
