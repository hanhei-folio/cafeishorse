import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/manager/toast_manager.dart';
import 'package:fetching_data/page/choose_keyword/choose_distance/choose_distance.dart';
import 'package:flutter/cupertino.dart';

class ChooseKeywordController {
  ChooseKeywordController(this.context, this.refresh);

  BuildContext context;
  VoidCallback refresh;

  List<String> keywords = ['가성비', '청결', '맛', '분위기', '친절'];
  List<String> pickedKeywords = [];

  void onKeywordClicked(int index) {
    String keyword = keywords[index];

    if (pickedKeywords.contains(keyword)) {
      pickedKeywords.remove(keyword);
    } else {
      if (pickedKeywords.length == 3) {
        ToastManager.toastInfo('3개까지만 선택 가능해요.');
        return;
      }
      pickedKeywords.add(keyword);
    }

    refresh();
  }

  void onNextButtonClicked() {
    if (pickedKeywords.length != 3) {
      ToastManager.toastInfo('키워드 3개를 선택해주세요.');
      return;
    }

    NavigatorManager.push(context, (context) => ChooseDistance(pickedKeywords));
  }
}