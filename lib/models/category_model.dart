// ignore_for_file: non_constant_identifier_names

class Category {
  int id;
  String category_name = '';

  Category({required this.id, required this.category_name});

  factory Category.fromJson(Map<String, dynamic> json) {
    print(json);
    return Category(
      id: json['id'],
      category_name: json['category_name'],
    );
  }
  static List<Category> CategoryList = [];
}
