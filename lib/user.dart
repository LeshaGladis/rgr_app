class User {
  String id;
  String name;
  String login;
  String password;

  User({
    required this.id,
    required this.name,
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'login': login,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      login: map['login'],
      password: map['password'],
    );
  }
}
