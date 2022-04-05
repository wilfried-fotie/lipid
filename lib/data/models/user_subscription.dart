import 'dart:convert';

class UserSubscription {
  final int id;
  final int? userId;
  final int? numberOfDays;
  final String? startDate;
  final String? endDate;
  final String status;
  final String? createdAt;

  UserSubscription({
    required this.id,
    this.userId,
    this.numberOfDays,
    this.startDate,
    this.endDate,
    required this.status,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'numberOfDays': numberOfDays,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory UserSubscription.fromMap(Map<String, dynamic> map) {
    return UserSubscription(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt(),
      numberOfDays: map['numberOfDays']?.toInt(),
      startDate: map['startDate'],
      endDate: map['endDate'],
      status: map['status'] ?? '',
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSubscription.fromJson(String source) =>
      UserSubscription.fromMap(json.decode(source));
}
