import 'package:fetching_data/page/choose_keyword/choose_keyword_controller.dart';
import 'package:flutter/material.dart';

class ChooseKeyword extends StatefulWidget {
  const ChooseKeyword({Key? key}) : super(key: key);

  @override
  State<ChooseKeyword> createState() => _ChooseKeywordState();
}

class _ChooseKeywordState extends State<ChooseKeyword> {
  late ChooseKeywordController controller;

  @override
  void initState() {
    controller = ChooseKeywordController(context, () => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
