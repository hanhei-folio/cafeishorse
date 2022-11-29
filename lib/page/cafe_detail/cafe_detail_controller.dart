import 'package:fetching_data/interface/cafe_interface.dart';
import 'package:fetching_data/interface/review_interface.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:fetching_data/model/review_model.dart';
import 'package:flutter/cupertino.dart';

class CafeDetailController {
  CafeDetailController(this.context, this.refresh, this.cafe) {
    loadData();
  }

  BuildContext context;
  VoidCallback refresh;
  CafeModel cafe;

  int status = 0;
  bool? isUserLikingThisCafe;
  List<ReviewModel> reviews = [];
  List<String> reviewPhotoUrls() {
    List<String> ret = [];
    for (var review in reviews) {
      ret.addAll(review.photoUrls);
    }
    return ret;
  }

  Future<void> loadData() async {
    try {
      isUserLikingThisCafe = await CafeInterface.getLike(cafe.id!);
      reviews = await ReviewInterface.get(cafe.id!);
      status = 1;
    } catch (e, s) {
      print(e);
      print(s);
      status = 2;
    } finally {
      refresh();
    }
  }

  Future<void> onLikeButtonClicked() async {
    await CafeInterface.pushLikeButton(cafe.id!, isUserLikingThisCafe!);
    isUserLikingThisCafe = await CafeInterface.getLike(cafe.id!);
    refresh();
  }
}