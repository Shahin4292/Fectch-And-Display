import 'package:fetch/app/model/makeup_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  Future<List<ProductModel>?> fetchProduct() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    return null;
  }
}
