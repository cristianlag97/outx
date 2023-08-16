import '../../domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  ProductsRepositoryImpl(this.dataSource);

  final ProductsDataSource dataSource;

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    return dataSource.createUpdateProduct(productLike);
  }

  @override
  Future<Product> getproductsById(String id) {
    return dataSource.getproductsById(id);
  }

  @override
  Future<List<Product>> getproductsByPage({int limit = 10, int ofsset = 0}) {
    return dataSource.getproductsByPage(limit: limit, ofsset: ofsset);
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    return dataSource.searchProductByTerm(term);
  }
}
