class UserEntity {
  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    required this.token,
    required this.photoUrl,
  });

  final String id;
  final String email;
  final String fullName;
  final String role;
  final String token;
  final String photoUrl;

  bool get isAdmin => role.contains('admin');
}
