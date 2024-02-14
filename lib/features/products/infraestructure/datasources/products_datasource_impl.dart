import 'package:dio/dio.dart';

import '../../../../config/plugins/dio_plugin.dart';
import '../../domain/domain.dart';
import '../infraestructure.dart';

class ProductsDatasourceImpl extends ProductsDataSource {
  ProductsDatasourceImpl({required this.accesToken});

  final String accesToken;

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    throw UnimplementedError();
  }

  @override
  Future<Product> getproductsById(String id) async {
    try {
      final response = await dio.get('/products/$id');
      final product = ProductMapper.jsonToEntity(response.data);
      return product;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw ProductnotFound();
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Product>> getproductsByPage({
    int limit = 10,
    int ofsset = 0,
  }) async {
    final response =
        await dio.get<List>('/products?limit=$limit&offset=$ofsset');
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(product));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    throw UnimplementedError();
  }
}
