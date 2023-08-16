import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outmap/features/products/presentation/providers/providers.dart';

import '../../domain/domain.dart';

class ProductState {
  ProductState({
    required this.id,
    this.product,
    this.isLoading = false,
    this.isSaving = false,
  });
  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) =>
      ProductState(
        id: id ?? this.id,
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );
}

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier({required this.productsRepository, required String productId})
      : super(ProductState(id: productId)) {
    loadProduct();
  }

  final ProductsRepository productsRepository;

  Future<void> loadProduct() async {
    state = state.copyWith(isLoading: true);
    try {
      final product = await productsRepository.getproductsById(state.id);

      state = state.copyWith(isLoading: false, product: product);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

final productProvider = StateNotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>((ref, productId) {
  final productsRepository = ref.watch(productsRepositoryProvider);

  return ProductNotifier(
      productsRepository: productsRepository, productId: productId);
});
