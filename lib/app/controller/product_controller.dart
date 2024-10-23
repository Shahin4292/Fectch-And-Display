import 'package:fetch/app/model/makeup_model.dart';
import 'package:fetch/services/api%20service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var product = await ApiService().fetchProduct();
      if (product != null) {
        productList.assignAll(product);
      }
    } finally {
      isLoading(false);
    }
  }
}
