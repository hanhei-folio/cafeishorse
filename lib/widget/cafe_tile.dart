import 'package:fetching_data/manager/location_manager.dart';
import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:fetching_data/page/cafe_detail/cafe_detail.dart';
import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  CafeTile(this.cafe);

  CafeModel cafe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          NavigatorManager.push(context, (context) => CafeDetail(cafe)),
      child: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: _image(),
                ),
                Expanded(child: _description()),
                SizedBox(width: 12),
                _distance(),
                SizedBox(width: 12),
              ],
            ),
          )),
    );
  }

  Widget _image() {
    if (cafe.mainPhotoUrl == null) {
      return Icon(Icons.local_cafe, size: 100);
    }
    return Image.network(cafe.mainPhotoUrl!,
        width: 100, height: 100, fit: BoxFit.cover);
  }

  Widget _description() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cafe.placeName.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(cafe.roadAddressName.toString()),
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow),
            Text(cafe.star.toString()),
            Spacer(),
          ],
        )
      ],
    );
  }

  Widget _distance() {
    int distance = LocationManager.getDistance(cafe);
    return Text('${distance}m');
  }
}
