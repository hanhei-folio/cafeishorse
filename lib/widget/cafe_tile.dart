import 'package:fetching_data/model/cafe_model.dart';
import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  CafeTile(this.cafe);

  CafeModel cafe;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              _description(),
            ],
          ),
        ));
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
        Text(cafe.placeName.toString()),
        Text(cafe.roadAddressName.toString()),
        Text(cafe.star.toString())
      ],
    );
  }
}
