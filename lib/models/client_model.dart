// ignore_for_file: non_constant_identifier_names
class Client {
  int id;
  String first_name = '';
  String last_name = '';
  String username = '';
  String password = '';

  Client({
    required this.id, 
    required this.first_name, 
    required this.last_name, 
    required this.username, 
    required this.password
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    print(json);
    return Client(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      username: json['username'],
      password: json['password'],
    );
  }
  static List<Client> CategoryList = [];
}
