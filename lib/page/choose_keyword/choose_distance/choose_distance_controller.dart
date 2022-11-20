import 'package:fetching_data/manager/toast_manager.dart';
import 'package:flutter/cupertino.dart';

class ChooseDistanceController {
  ChooseDistanceController(this.context, this.refresh, this.pickedKeywords);

  BuildContext context;
  VoidCallback refresh;
  List<String> pickedKeywords;

  List<String> distances = ['100m', '200m', '500m', '1km'];
  List<String> pickedDistances = [];

  void onDistanceClicked(int index) {
    String distance = distances[index];

    if (pickedDistances.contains(distance)) {
      pickedDistances.remove(distance);
    } else {
      if (pickedDistances.length == 1) {
        ToastManager.toastInfo('1개만 선택 가능해요.');
        return;
      }
      pickedDistances.add(distance);
    }

    refresh();
  }
}