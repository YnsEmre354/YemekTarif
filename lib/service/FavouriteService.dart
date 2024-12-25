import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app2/viewModel/observableListViewModel.dart';

import '../viewModel/observableListViewModel.dart';

class FavouriteService {
  static const String apiUrl =
      'https://localhost:7072/api/Favourite'; // API base URL'nizi burada girin

  // GET: Favori yemekleri almak
  static Future<List<Map<String, dynamic>>> getFavouriteFoods(
      String userName) async {
    // Check if userName is empty
    if (userName.isEmpty) {
      throw Exception('User name cannot be empty');
    }

    try {
      final response = await http.get(
        Uri.parse(
            'https://localhost:7072/api/Favourite/getFoodsAndRecipes?userName=${Uri.encodeComponent(userName)}' // URL encoding
            ),
      );

      if (response.statusCode == 200) {
        // Başarılı istek sonucu gelen veriyi JSON formatında döndürüyoruz
        List jsonResponse = json.decode(response.body);
        return List<Map<String, dynamic>>.from(jsonResponse);
      } else {
        // Hata durumunda detaylı hata mesajı göster
        print('Error: ${response.statusCode} - ${response.body}');
        throw Exception('Favori yemekler alınamadı');
      }
    } catch (e) {
      print('Request failed: $e');
      throw Exception('Failed to load favorite foods');
    }
  }

  static Future<void> postFavourite(
      String userName, String foodName, bool isFavourite) async {
    try {
      // Request Body'yi oluştur
      Map<String, dynamic> requestBody = {
        'favouriteName': foodName, // Yemek adını gönderiyoruz
        'userName': userName, // Kullanıcı adını gönderiyoruz
        'isFavourite': isFavourite, // Favori durumunu gönderiyoruz
      };

      // Request Body'yi logla
      print(
          'Request Body: ${jsonEncode(requestBody)}'); // JSON formatında loglama

      // HTTP POST isteği gönder
      final response = await http.post(
        Uri.parse('$apiUrl/postFavourite'),
        headers: <String, String>{
          'Content-Type':
              'application/json', // JSON formatında veri gönderiyoruz
        },
        body: jsonEncode(
            requestBody), // Request Body'yi JSON formatında gönderiyoruz
      );

      // Yanıtı kontrol et
      if (response.statusCode == 200) {
        print('Favori yemek başarılı şekilde güncellendi');
      } else {
        print('Hata: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Hata: $e');
    }
  }
}
