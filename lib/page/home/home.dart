import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:fetching_data/page/choose_keyword/choose_keyword.dart';
import 'package:fetching_data/page/home/home_controller.dart';
import 'package:fetching_data/page/sign_in/sign_in.dart';
import 'package:fetching_data/widget/cafe_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController(context, () => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Spacer(),
        const Icon(Icons.star, size: 100),
        const Icon(Icons.local_cafe, size: 100),
        SizedBox(height: 48),
        OutlinedButton(
            onPressed: () => NavigatorManager.pushReplaceAll(
                context, (context) => ChooseKeyword()),
            child: Text('Choose Keyword')),
        SizedBox(height: 24),
        OutlinedButton(
            onPressed: () {
              // TODO 찜한 목록으로 가기
            },
            child: Text('내가 찜한 목록')),
        SizedBox(height: 72),
        Row(
          children: [
            Spacer(),
            TextButton(
                onPressed: () => NavigatorManager.pushReplaceAll(
                    context, (context) => SignIn()),
                child: Text('로그아웃')),
            SizedBox(width: 48)
          ],
        ),
        Spacer(),
      ],
    );
  }
}
