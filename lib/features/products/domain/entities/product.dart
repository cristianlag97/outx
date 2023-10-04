import '../../../auth/domain/domain.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.slug,
    required this.stock,
    required this.sizes,
    required this.gender,
    required this.tags,
    required this.user,
    required this.images,
  });

  String id;
  String title;
  num price;
  String description;
  String slug;
  int stock;
  List<String> sizes;
  String gender;
  List<String> tags;
  UserEntity? user;
  List<String> images;
}
