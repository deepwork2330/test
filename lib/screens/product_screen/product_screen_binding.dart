import 'package:get/get.dart';
import 'product_screen_controller.dart';

class ProductScreenBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<ProductScreenController>(() => ProductScreenController());
    }
}
