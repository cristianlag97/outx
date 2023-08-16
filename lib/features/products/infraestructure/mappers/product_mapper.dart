import 'package:outmap/config/config.dart';
import 'package:outmap/features/auth/infraestructure/infraestructure.dart';

import '../../domain/domain.dart';

class ProductMapper {
  static Product jsonToEntity(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        slug: json['slug'],
        stock: json['stock'],
        sizes: List<String>.from(json['sizes'].map((size) => size)),
        gender: json['gender'],
        tags: List<String>.from(json['tags'].map((tag) => tag)),
        user: UserMapper.userJsonToEntity(json['user']),
        images: List<String>.from(
          json['images'].map(
            (image) => image.startsWith('http')
                ? image
                : '${Environment.apiUrl}/files/product/$image',
          ),
        ),
      );
}
