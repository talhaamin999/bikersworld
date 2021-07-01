import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingsBar extends StatelessWidget {
  RatingsBar(this.size, {this.userRating});

  double size;
  static double ratings = 4.23;
  final double userRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        initialRating: userRating != null ? userRating : 4.23,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
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

