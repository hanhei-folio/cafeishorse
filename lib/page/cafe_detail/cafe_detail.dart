import 'package:card_swiper/card_swiper.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:fetching_data/model/review_model.dart';
import 'package:fetching_data/page/cafe_detail/cafe_detail_controller.dart';
import 'package:fetching_data/widget/error_text.dart';
import 'package:fetching_data/widget/loading_widget.dart';
import 'package:fetching_data/widget/review_tile.dart';
import 'package:flutter/material.dart';

class CafeDetail extends StatefulWidget {
  CafeDetail(this.cafe);

  CafeModel cafe;

  @override
  State<CafeDetail> createState() => _CafeDetailState();
}

class _CafeDetailState extends State<CafeDetail> {
  late CafeDetailController controller;

  @override
  void initState() {
    controller =
        CafeDetailController(context, () => setState(() {}), widget.cafe);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _cafeInfo(),
          SizedBox(height: 24),
          _reviews(),
        ],
      ),
    );
  }

  Widget _cafeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image(),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(controller.cafe.placeName.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Spacer(),
                  Icon(Icons.favorite)
                ],
              ),
              SizedBox(height: 6),
              Text(controller.cafe.roadAddressName.toString()),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(controller.cafe.star.toString()),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _image() {
    Widget child = LoadingWidget();

    if (controller.status == 2) {
      child = ErrorText();
    } else if (controller.status == 1) {
      List<String> reviewPhotoUrls = controller.reviewPhotoUrls();

      if (reviewPhotoUrls.isEmpty) {
        child = Icon(Icons.local_cafe, size: 100);
      } else {
        child = SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.6,
          child: Swiper(
              itemCount: reviewPhotoUrls.length,
              itemBuilder: (context, i) {
                return Image.network(reviewPhotoUrls[i],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.cover);
              }),
        );
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.6,
      child: Center(child: child),
    );
  }

  Widget _reviews() {
    List<ReviewModel> reviews = controller.reviews;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          for (var review in reviews) ReviewTile(review),
        ],
      ),
    );
  }
}
