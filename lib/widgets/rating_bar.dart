import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingsBar extends StatelessWidget {
  RatingsBar(this.size, {this.userRating});

  double size;
  static double ratings = 2.5;
  final double userRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        ignoreGestures: userRating != null ? true : false,
        initialRating: userRating != null ? userRating : 2.5,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 19,
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


class StarDisplay extends StatelessWidget {
  final double userRating;
  StarDisplay({this.userRating,});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(userRating.toInt(), (index) {
        return Icon(
          index < userRating ? Icons.star : Icons.star_border, color: Color(0xffffbf00),
        );
      }),
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRatingPlus extends StatelessWidget {

  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRatingPlus({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}