import 'package:fetching_data/manager/dio_manager/dio_manager.dart';
import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:flutter/material.dart';

class UserInfoHolder {
  static int? userId;

  // static void signOut(BuildContext context) {
  //   userId = null;
  //   DioManager().removeToken();
  //   NavigatorManager.pushReplaceAll(context, (context) => SignIn());
  // }
}