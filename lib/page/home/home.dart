import 'package:fetching_data/model/cafe_model.dart';
import 'package:fetching_data/page/home/home_controller.dart';
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
    controller.loadData();
    // home data 출력을 위해

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
    if (controller.status == 0) {
      return CircularProgressIndicator();
    } else if (controller.status == 1) {
      return _cafeTiles(controller.cafes);
    } else {
      return Text('통신 중 오류가 발생했습니다. 다음에 다시 시도해주세요.');
    }
  }

  Widget _cafeTiles(List<CafeModel> cafes) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            for (var cafe in cafes) CafeTile(cafe),
          ],
        ),
      ),
    );
  }
}
