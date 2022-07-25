class User {
  final String message;
  final int userId;
  final String shortName;
  final String token;
  final DateTime tokenExpiresAt;
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
}
