import 'package:outmap/features/auth/domain/domain.dart';

class UserMapper {
  static UserEntity userJsonToEntity(Map<String, dynamic> json) => UserEntity(
        id: json['id'] ?? '',
        email: json['email'] ?? '',
        fullName: json['fullName'] ?? '',
        roles:
            List<String>.from(json['roles'].map((role) => role) ?? <String>[]),
        token: json['token'] ?? '',
        photoUrl: json['photoUrl'] ?? '',
      );
}
