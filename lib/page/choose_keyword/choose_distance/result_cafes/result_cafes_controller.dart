import 'package:fetching_data/interface/cafe_interface.dart';
import 'package:fetching_data/manager/location_manager.dart';
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
  List<CafeModel> baseCafes = [];
  List<CafeModel> cafes = [];
  bool isDistanceSorted = false;

  Future<void> loadData(
      List<String> pickedKeywords, String pickedDistance) async {
    try {
      String x = await LocationManager.getCurrentLatitude();
      String y = await LocationManager.getCurrentLongitude();
      baseCafes = await CafeInterface.get(pickedKeywords, pickedDistance, x, y);
      cafes.addAll(baseCafes);
      status = 1;
    } catch (e, s) {
      print(e);
      print(s);
      status = 2;
    } finally {
      refresh();
    }
  }

  void onDistanceSortButtonClicked() {
    if (isDistanceSorted) {
      cafes.clear();
      cafes.addAll(baseCafes);
    } else {
      // TODO 카페 위치(위도경도), 내 위치(위도경도) 이용하여 거리 계산, 정렬
      cafes.sort();
    }
    refresh();
  }
}
