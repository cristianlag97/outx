import '../entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getproductsByPage({int limit = 10, int ofsset = 0});
  Future<Product> getproductsById(String id);
  Future<List<Product>> searchProductByTerm(String term);
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike);
}
