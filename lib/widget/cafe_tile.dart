import 'package:fetching_data/model/cafe_model.dart';
import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  CafeTile(this.cafe);

  CafeModel cafe;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 12),
    child: Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Center(child: Text(cafe.id.toString())),
          Center(child: Text(cafe.place_name.toString()),),
        ],
      ),
    ),);
  }
}
