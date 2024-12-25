import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class AddFoodService {
  // Kategorileri API'den Çekme Fonksiyonu
  static Future<List<String>> getCategories() async {
    const String baseUrl = 'https://localhost:7072/api/Foods/getCategories';
    try {
      // HTTP GET isteği gönder
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // Gelen JSON verisini parse et
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((category) => category.toString()).toList();
      } else {
        throw Exception('API isteği başarısız oldu: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  Future<bool> addCookingTime({
    required String foodName,
    required int prepTime,
    required int cookTime,
  }) async {
    const String endpoint = 'https://localhost:7072/api/recipes/addCookingTime';

    // Gönderilecek JSON verisi
    final Map<String, dynamic> requestBody = {
      "FoodName": foodName,
      "PrepTime": prepTime,
      "CookTime": cookTime,
    };

    try {
      // HTTP POST isteği
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Başarılı yanıt
        print("Tarif başarıyla eklendi.");
        return true;
      } else {
        // Başarısız yanıt
        print("Hata: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      // İstisna durumu
      print("Bir hata oluştu: $e");
      return false;
    }
  }

  Future<bool> addRecipeTable({
    required String foodName,
    required String recipeName,
    required String username, // yeni parametre
    required String? categoryName, // yeni parametre
  }) async {
    const String endpoint = 'https://localhost:7072/api/recipes/addRecipeTable';

    // Gönderilecek JSON verisi
    final Map<String, dynamic> requestBody = {
      "FoodName": foodName,
      "RecipeName": recipeName,
    };

    // Sorgu parametrelerini ekle
    final Uri uri = Uri.parse(endpoint).replace(queryParameters: {
      "username": username,
      "categoryName": categoryName,
    });

    try {
      // HTTP POST isteği
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Başarılı yanıt
        print("Tarif başarıyla eklendi.");
        return true;
      } else {
        // Başarısız yanıt
        print("Hata: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      // İstisna durumu
      print("Bir hata oluştu: $e");
      return false;
    }
  }
}
