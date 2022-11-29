import 'package:fetching_data/model/review_model.dart';
import 'package:flutter/material.dart';

class ReviewTile extends StatefulWidget {
  ReviewTile(this.review);

  ReviewModel review;

  @override
  State<ReviewTile> createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.review.username.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: Colors.yellow),
                  Text(widget.review.point.toString())
                ],
              ),
              SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: Text(widget.review.contents.toString()),
              ),
            ],
          ),
        ));
  }
}
