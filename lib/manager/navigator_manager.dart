import 'package:flutter/material.dart';

class NavigatorManager {
  static Future<dynamic> push(BuildContext context,
      Widget Function(BuildContext context) builder) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: builder));
  }

  static Future<dynamic> pushReplaceAll(BuildContext context,
      Widget Function(BuildContext context) builder) async {
    return await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: builder), (route) => false);
  }
}
