import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductRepository {
  /**This below line will create the private constructor */
  FakeProductRepository._();
  static FakeProductRepository instance = FakeProductRepository._();

  List<Product> getProductList() {
    return kTestProducts;
  }

  Product? getProduct(String id) {
    return kTestProducts.firstWhere((product) => product.id == id);
  }
}
