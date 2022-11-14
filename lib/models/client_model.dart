// ignore_for_file: non_constant_identifier_names
class Client {
  int id = 0;
  String first_name = '';
  String last_name = '';
  String email = '';
  String username = '';
  String password = '';
  String parishID = '';
  String roleID = '';

  Client({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.username,
    required this.password,
    required this.parishID,
    required this.roleID,
  });

  Client.withoutID({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.username,
    required this.password,
    required this.parishID,
    required this.roleID,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    print(json);
    return Client(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      parishID: json['parishID'],
      roleID: json['roleID'],
    );
  }
  static List<Client> ClientList = [];
}
