import 'package:go_router/go_router.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/products_list/products_list_screen.dart';

/**Final varible has been used for gorouter */
final gorouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsListScreen(),
      routes: [
        GoRoute(
          path: 'cart',
          builder: (context, state) => const ShoppingCartScreen(),
        ),
      ],
    ),
  ],
);
