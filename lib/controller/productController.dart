import 'package:item_list_with_api/model/productModel.dart';
import 'package:http/http.dart' as http;
import 'function.dart';
import 'dart:convert';

Future<List<Product>> getProduct() async {
  final response = await http.get(Uri.parse('$url/products'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Product> products =
        data.map((json) => Product.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Failed to load datas');
  }
}
