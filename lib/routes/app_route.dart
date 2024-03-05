

import 'package:demoapp/screens/product_screen/product_details_screen.dart';
import 'package:demoapp/screens/product_screen/product_screen.dart';
import 'package:demoapp/screens/product_screen/product_screen_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String productDetailsScreen = '/product_details';
  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const ProductScreen(),
      bindings: [
        ProductScreenBinding(),
      ],
    ),
    GetPage(
      name: productDetailsScreen,
      page: () =>  ProductDetailsScreen(),
      bindings: [
        ProductScreenBinding(),
      ],
    ),
  ];

  static get dataList => null;
}
