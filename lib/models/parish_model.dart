// ignore_for_file: non_constant_identifier_names

class Parish {
  int id;
  String parish_name = '';

  Parish({required this.id, required this.parish_name});

  factory Parish.fromJson(Map<String, dynamic> json) {
    print(json);
    return Parish(
      id: json['id'],
      parish_name: json['parish_name'],
    );
  }
  static List<Parish> ParishList = [];
}
