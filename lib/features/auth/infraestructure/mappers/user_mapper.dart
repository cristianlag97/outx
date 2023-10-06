import 'package:outmap/features/auth/domain/domain.dart';

class UserMapper {
  static UserEntity userJsonToEntity(Map<String, dynamic> json) => UserEntity(
        id: json['id'] ?? '',
        email: json['email'] ?? '',
        fullName: json['fullName'] ?? '',
        role: json['role'] ?? '',
        token: json['token'] ?? '',
        photoUrl: json['photoUrl'] ?? '',
      );
}
