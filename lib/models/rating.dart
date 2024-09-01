import 'package:business_directory/models/user.dart';

class Rating {
  Rating({
    required this.id,
    required this.rating,
    required this.ratedBy,
    required this.createdAt,
    this.comment,
  });

  final String id;
  final num rating;
  final String? comment;
  final DateTime createdAt;
  final User ratedBy;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json["id"],
      rating: json['rating'],
      comment: json['comment'],
      ratedBy: User.fromJson(json['user']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
