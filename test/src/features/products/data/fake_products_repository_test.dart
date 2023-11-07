import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';

void main() {
  FakeProductsRepository makeProductRepository() =>
      FakeProductsRepository(addDelay: false);
  group('FakeProductRepository', () {
    test('getProductsList returns global list', () {
      final productsRepository = makeProductRepository();
      expect(productsRepository.getProductsList(), kTestProducts);
    });

    test('getProduct(1) returns first item', () {
      final productRepository = makeProductRepository();
      expect(productRepository.getProduct('1'), kTestProducts[0]);
    });

    test('getProduct(100) returns null', () {
      final productRepository = makeProductRepository();
      expect(productRepository.getProduct('100'), null);
    });
  });

  test('fetchProductList rteurns global list', () async {
    final productRepository = makeProductRepository();

    expect(await productRepository.fetchProductsList(), kTestProducts);
  });

  test('watchProductsList emits global list', () {
    final productRepository = makeProductRepository();

    expect(productRepository.watchProductsList(), emits(kTestProducts));
  });

  test('watchProduct(1) emits first item', () {
    final productRepository = makeProductRepository();

    expect(productRepository.watchProduct('1'), emits(kTestProducts[0]));
  });

  test('watchProduct(100) emits null', () {
    final productRepository = makeProductRepository();

    expect(productRepository.watchProduct('100'), emits(null));
  });
}
