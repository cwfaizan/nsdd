import 'package:hive_flutter/adapters.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String message;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final String shortName;
  @HiveField(3)
  final String token;
  @HiveField(4)
  final DateTime tokenExpiresAt;
  @HiveField(5)
  final List<dynamic> roles;

  User({
    required this.message,
    required this.userId,
    required this.shortName,
    required this.token,
    required this.tokenExpiresAt,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        message: json['message'],
        userId: json['user_id'],
        shortName: json['short_name'],
        token: json['token'],
        tokenExpiresAt: DateTime.parse(json['token_expires_at']),
        roles: json['roles'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user_id': userId,
        'short_name': shortName,
        'token': token,
        'token_expires_at': tokenExpiresAt.toString(),
        'roles': roles
      };
}
