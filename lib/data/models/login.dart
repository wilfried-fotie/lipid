import 'dart:convert';

class Login {
  final String identifiant;
  final String password;

  Login({
    required this.identifiant,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'identifiant': identifiant,
      'password': password,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      identifiant: map['identifiant'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));
}
