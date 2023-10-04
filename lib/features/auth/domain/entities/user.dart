class UserEntity {
  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.roles,
    required this.token,
    required this.photoUrl,
  });

  final String id;
  final String email;
  final String fullName;
  final List<String> roles;
  final String token;
  final String photoUrl;

  bool get isAdmin => roles.contains('admin');
}
