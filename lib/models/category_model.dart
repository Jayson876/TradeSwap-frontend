// ignore_for_file: non_constant_identifier_names

class Category {
  String id;
  String category_name = '';

  Category({required this.id, required this.category_name});

  factory Category.fromJson(Map<String, dynamic> json) {
    print(json);
    return Category(
      id: json['_id'],
      category_name: json['category_name'],
    );
  }
  static List<Category> CategoryList = [];
}
