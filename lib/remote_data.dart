import 'package:flutter_assignment/data_model.dart';
import 'package:http/http.dart' as http;

class RemoteData {
  Future<Product?> getProducts() async {
    var url = Uri.parse('http://3.111.240.149:8082/v1/categories');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    }
    return null;
  }
}
