import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
// ignore_for_file: slash_for_doc_comments

class FakeProductRepository {
  final List<Product> _products = kTestProducts;

  /// This below line will create the private constructor
  // FakeProductRepository._();
  // static FakeProductRepository instance = FakeProductRepository._();

  List<Product> getProductList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  /// Future will fetch from APIs
  Future<List<Product>> fetchProductsList() {
    return Future.value(_products);
  }

  /// Stream will watch all the APIs
  Stream<List<Product>> watchProductList() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

/**productsRepositoryProvider is called hasglobalvariable we can use this variable in many places */
/**FakeProductRepository is used to specify type annotation */
/**Ref is used to implement it on the body */

final productsRepositoryProvider = Provider<FakeProductRepository>((ref) {
  return FakeProductRepository();
});
