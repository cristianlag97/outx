class UserModel {
  final String id;
  final String email;
  final String fullName;
  // final List<String> roles;
  final String? token;
  final String photoURL;
  final String gender;
  final String type;
  final bool isFacebook;
  final bool isGoogle;
  final String password;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.photoURL,
    // required this.roles,
    required this.token,
    required this.gender,
    required this.type,
    required this.isFacebook,
    required this.isGoogle,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'] ?? '',
        fullName = json['fullName'] ?? '',
        // roles = json['roles'] ?? ['user'],
        password = json['password'] ?? '',
        token = '',
        photoURL = json['photoURL'] ?? '',
        gender = json['gender'] ?? 'Hombre',
        type = json['type'] ?? 'Persona',
        isFacebook = json['isFacebook'] ?? false,
        isGoogle = json['isGoogle'] ?? false;

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        // "roles": roles,
        "photoURL": photoURL,
        "gender": gender,
        "type": type,
        "isFacebook": isFacebook,
        "isGoogle": isGoogle,
      };
}
