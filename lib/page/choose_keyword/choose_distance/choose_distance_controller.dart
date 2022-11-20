import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/manager/toast_manager.dart';
import 'package:fetching_data/page/choose_keyword/choose_distance/result_cafes/result_cafes.dart';
import 'package:flutter/cupertino.dart';

class ChooseDistanceController {
  ChooseDistanceController(this.context, this.refresh, this.pickedKeywords);

  BuildContext context;
  VoidCallback refresh;
  List<String> pickedKeywords;

  List<String> distances = ['100m', '200m', '500m', '1km'];
  String pickedDistance = '';

  void onDistanceClicked(int index) {
    String distance = distances[index];

    if (pickedDistance == distance) {
      pickedDistance = '';
    } else {
      pickedDistance = distance;
    }

    refresh();
  }

  void onNextButtonClicked() {
    if (pickedDistance.isEmpty) {
      ToastManager.toastInfo('거리를 하나 선택해주세요.');
      return;
    }

    NavigatorManager.push(
        context, (context) => ResultCafes(pickedKeywords, pickedDistance));
  }
}
