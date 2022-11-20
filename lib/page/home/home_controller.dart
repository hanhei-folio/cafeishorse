import 'package:fetching_data/interface/cafe_interface.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  HomeController(this.context, this.refresh);

  BuildContext context;
  VoidCallback refresh;

  int status = 0;
  List<CafeModel> cafes = [];

  Future<void> loadData() async {
    try {
      cafes = await CafeInterface.getCafes();
      // cafes.add(cafe);
      // cafes = await CafeInterface.getCafes();
      status = 1;
    } catch (e, s) {
      print(e);
      print(s);
      status = 2;
    } finally {
      refresh();
    }
  }
}