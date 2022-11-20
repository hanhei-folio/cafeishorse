import 'package:fetching_data/page/choose_keyword/choose_distance/choose_distance_controller.dart';
import 'package:fetching_data/page/choose_keyword/choose_keyword_controller.dart';
import 'package:flutter/material.dart';

class ChooseDistance extends StatefulWidget {
  ChooseDistance(this.pickedKeywords);

  List<String> pickedKeywords;

  @override
  State<ChooseDistance> createState() => _ChooseDistanceState();
}

class _ChooseDistanceState extends State<ChooseDistance> {
  late ChooseDistanceController controller;

  @override
  void initState() {
    controller = ChooseDistanceController(context, () => setState(() {}), widget.pickedKeywords);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('카페와의 거리는 몇 m 이내로 추천할까요?',
                      style: TextStyle(fontSize: 24))),
              SizedBox(height: 48),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++) _distanceTile(i),
                ],
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('다음'),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _distanceTile(int index) {
    String keyword = controller.distances[index];

    bool isPicked = controller.pickedKeywords.contains(keyword);
    String number = isPicked
        ? (controller.pickedKeywords.indexOf(keyword) + 1).toString()
        : '';
    String text = number.isEmpty ? keyword : '$number. $keyword';

    if (isPicked) {
      return GestureDetector(
        onTap: () => controller.onDistanceClicked(index),
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(36),
          ),
          child:
              Center(child: Text(text, style: TextStyle(color: Colors.white))),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => controller.onDistanceClicked(index),
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(36),
          ),
          child:
              Center(child: Text(text, style: TextStyle(color: Colors.black))),
        ),
      );
    }
  }
}
