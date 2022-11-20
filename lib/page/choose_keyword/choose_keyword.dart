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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('카페를 고를 때 당신의 선호도는?\n중요한 순서대로 골라주세요.',
                      style: TextStyle(fontSize: 24))),
              SizedBox(height: 48),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++) _keywordTile(i),
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

  Widget _keywordTile(int index) {
    String keyword = controller.keywords[index];

    bool isPicked = controller.pickedKeywords.contains(keyword);
    String number = isPicked
        ? (controller.pickedKeywords.indexOf(keyword) + 1).toString()
        : '';
    String text = number.isEmpty ? keyword : '$number. $keyword';

    if (isPicked) {
      return GestureDetector(
        onTap: () => controller.onKeywordClicked(index),
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
        onTap: () => controller.onKeywordClicked(index),
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
