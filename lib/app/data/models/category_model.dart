class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });
  final String name;
  final String id;
  final String description;
  final DateTime createdAt;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
