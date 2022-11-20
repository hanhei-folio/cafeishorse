import 'package:fetching_data/page/choose_keyword/choose_distance/result_cafes/result_cafes_controller.dart';
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
    controller = ResultCafesController(context, () => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
