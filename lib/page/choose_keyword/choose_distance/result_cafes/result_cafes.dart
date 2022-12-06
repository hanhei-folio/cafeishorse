import 'package:fetching_data/constant/constants.dart';
import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:fetching_data/page/choose_keyword/choose_distance/result_cafes/result_cafes_controller.dart';
import 'package:fetching_data/page/home/home.dart';
import 'package:fetching_data/widget/cafe_tile.dart';
import 'package:fetching_data/widget/error_text.dart';
import 'package:fetching_data/widget/loading_widget.dart';
import 'package:flutter/material.dart';

class ResultCafes extends StatefulWidget {
  ResultCafes(this.pickedKeywords, this.pickedDistance);

  List<String> pickedKeywords;
  String pickedDistance;

  @override
  State<ResultCafes> createState() => _ResultCafesState();
}

class _ResultCafesState extends State<ResultCafes> {
  late ResultCafesController controller;

  @override
  void initState() {
    controller = ResultCafesController(context, () => setState(() {}),
        widget.pickedKeywords, widget.pickedDistance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    if (controller.status == 0) {
      return LoadingWidget();
    }

    if (controller.status == 2) {
      return ErrorText();
    }

    List<CafeModel> cafes = controller.cafes;

    if (cafes.isEmpty) {
      return Center(child: Text('조건에 부합하는 카페 데이터가 없습니다.'));
    }

    return Column(
      children: [
        SizedBox(height: 12),
        Row(
          children: [
            SizedBox(width: 12),
            OutlinedButton(
                onPressed: () => controller.onDistanceSortButtonClicked(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((_) {
                  return controller.isDistanceSorted
                      ? Colors.yellow
                      : primaryColor;
                })),
                child: Text('거리순',
                    style: TextStyle(
                        color: controller.isDistanceSorted
                            ? Colors.black
                            : Colors.white))),
            // OutlinedButton(
            //     onPressed: () => controller.onDistanceSortButtonClicked(),
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.resolveWith((_) {
            //           return controller.isDistanceSorted
            //               ? Colors.yellow
            //               : primaryColor;
            //         })),
            //     child: Text('리뷰많은순',
            //         style: TextStyle(
            //             color: controller.isDistanceSorted
            //                 ? Colors.black
            //                 : Colors.white))),
            SizedBox(width: 12),
            OutlinedButton(
                onPressed: () => controller.onStarCountSortButtonClicked(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((_) {
                      return controller.isStarCountSorted
                          ? Colors.yellow
                          : primaryColor;
                    })),
                child: Text('별점순',
                    style: TextStyle(
                        color: controller.isStarCountSorted
                            ? Colors.black
                            : Colors.white))),
            Spacer(),
            OutlinedButton(
                onPressed: () {
                  NavigatorManager.pushReplaceAll(context, (context) => Home());
                },
                child: Text('돌아가기')),
            SizedBox(width: 12),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [for (var cafe in cafes) CafeTile(cafe)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
