import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outmap/features/products/domain/domain.dart';
import 'package:outmap/features/products/infraestructure/infraestructure.dart';

import '../../../auth/presentation/providers/providers.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final productsRepository = ProductsRepositoryImpl(
    ProductsDatasourceImpl(accesToken: accessToken),
  );

  return productsRepository;
});
