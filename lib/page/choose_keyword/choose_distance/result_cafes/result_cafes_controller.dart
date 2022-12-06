import 'package:fetching_data/interface/cafe_interface.dart';
import 'package:fetching_data/manager/location_manager.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

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

  bool isDistanceSorted = false;
  Future<void> onDistanceSortButtonClicked() async {
    isStarCountSorted = false;
    if (isDistanceSorted) {
      cafes.clear();
      cafes.addAll(baseCafes);
      isDistanceSorted = false;
    } else {
      // TODO 카페 위치(위도경도), 내 위치(위도경도) 이용하여 거리 계산, 정렬
      // 거리가 현위치에 가까운 순으로 정렬됩니다.
      cafes.sort((a, b) => LocationManager.getDistance(a) - LocationManager.getDistance(b));
      isDistanceSorted = true;
    }
    refresh();
  }

  // bool isReviewCountSorted = false;
  // Future<void> onReviewCountSortButtonClicked() async {
  //   if (isDistanceSorted) {
  //     cafes.clear();
  //     cafes.addAll(baseCafes);
  //     isReviewCountSorted = false;
  //   } else {
  //     cafes.sort((a, b) => a.)
  //     isReviewCountSorted = true;
  //   }
  //   refresh();
  // }

  bool isStarCountSorted = false;
  Future<void> onStarCountSortButtonClicked() async {
    isDistanceSorted = false;
    if (isStarCountSorted) {
      cafes.clear();
      cafes.addAll(baseCafes);
      isStarCountSorted = false;
    } else {
      cafes.sort((a, b) {
        double starA = 0;
        if (a.star != null) starA = double.parse(a.star!);
        double starB = 0;
        if (b.star != null) starB = double.parse(b.star!);
        return starB.compareTo(starA);
      });
      isStarCountSorted = true;
    }
    refresh();
  }
}
