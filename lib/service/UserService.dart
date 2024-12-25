import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app2/model/UserModel.dart';

class FoodService {
  static const String baseUrl = 'https://localhost:7072/api/Users';

  Future<List<UserModel>> getUserName() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        return data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load foods');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
