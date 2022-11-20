import 'package:flutter/cupertino.dart';

class HomeController {
  HomeController(this.context, this.refresh);

  BuildContext context;
  VoidCallback refresh;

  Future<void> signOut() async {
    // TODO signOut
  }
}