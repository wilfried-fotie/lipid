import 'dart:convert';

import 'package:lipid/data/models/user_subscription.dart';

import 'account.dart';

class User {
  final String name;
  final String phone;
  final String email;
  final bool? isActive;
  final String password;
  final String? passwordConfirmation;
  final String? createdAt;
  final Account? account;
  final UserSubscription? subscription;

  User({
    required this.name,
    required this.phone,
    required this.email,
    this.isActive,
    required this.password,
    this.passwordConfirmation,
    this.createdAt,
    this.account,
    this.subscription,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'is_active': isActive,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'created_at': DateTime.now().toUtc().toString(),
      'account': account?.toMap(),
      'subscription': subscription?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      isActive: map['isActive'],
      password: map['password'] ?? '',
      passwordConfirmation: map['passwordConfirmation'],
      createdAt: map['createdAt'],
      account: map['account'] != null ? Account.fromMap(map['account']) : null,
      subscription: map['subscription'] != null
          ? UserSubscription.fromMap(map['subscription'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? name,
    String? phone,
    String? email,
    bool? isActive,
    String? password,
    String? passwordConfirmation,
    String? createdAt,
    Account? account,
    UserSubscription? subscription,
  }) {
    return User(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      createdAt: createdAt ?? this.createdAt,
      account: account ?? this.account,
      subscription: subscription ?? this.subscription,
    );
  }
}
