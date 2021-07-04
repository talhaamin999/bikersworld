class Reviews {

  final String title;
  final double starRating;
  final String description;
  final String id;

  Reviews({this.title, this.starRating, this.description, this.id});

  factory Reviews.fromJson(Map<String, dynamic> json, String docId){
    return Reviews(
      id: docId,
      title: json['title'],
      starRating: json['star_rating'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'star_rating': starRating,
      'description': description,
    };
  }
}