import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingsBar extends StatelessWidget {
  RatingsBar(this.size, {this.userrating});

  double size;
  static double ratings = 2.5;
  final double userrating;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        initialRating: userrating != null ? userrating:2.5,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: size,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          ratings = rating;
        },
      ),
    );
  }
}

