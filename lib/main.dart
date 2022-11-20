import 'package:fetching_data/page/sign_in/sign_in.dart';
import 'package:fetching_data/page/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
    home: SignIn(),
  ));
}
