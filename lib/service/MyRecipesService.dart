import 'dart:convert';
import 'package:http/http.dart' as http;

class MyRecipesService {
  static Future<List> getRecipes() async {
    final url =
        Uri.parse('https://localhost:7072/api/recipes/getRecipes'); // API URL

    try {
      // API'den gelen cevabı alıyoruz
      final response = await http.get(url);

      print('Response Body: ${response.body}'); // Yanıtı konsola yazdırıyoruz.

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        print('Decoded Data: $data'); // Ayrıştırılmış veriyi yazdırıyoruz.

        // Veriyi alıyoruz (recipes anahtarından)
        final recipes = data['recipes'] != null
            ? List<Map<String, dynamic>>.from(data['recipes'])
            : [];

        print('Recipes: $recipes'); // Final listeyi yazdırıyoruz.

        return recipes;
      } else if (response.statusCode == 404) {
        throw Exception('No recipes found.');
      } else {
        throw Exception(
            'Failed to load recipes. Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
