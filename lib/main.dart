import 'package:fetching_data/page/home/home.dart';
import 'package:fetching_data/page/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.brown[300],
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.brown),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.brown),
        )),
    home: SignIn(),
  ));
}
