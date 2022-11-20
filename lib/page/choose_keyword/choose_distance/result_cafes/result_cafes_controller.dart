import 'package:fetching_data/interface/cafe_interface.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:flutter/cupertino.dart';

class ResultCafesController {
  ResultCafesController(this.context, this.refresh, List<String> pickedKeywords,
      String pickedDistance) {
    loadData(pickedKeywords, pickedDistance);
  }

  BuildContext context;
  VoidCallback refresh;

  int status = 0;
  List<CafeModel> cafes = [];

  Future<void> loadData(
      List<String> pickedKeywords, String pickedDistance) async {
    try {
      cafes = await CafeInterface.get(pickedKeywords, pickedDistance);
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
