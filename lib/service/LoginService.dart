import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  // Backend API URL

  Future<Map<String, dynamic>> login(String username, String password) async {
    const String baseUrl = 'https://localhost:7072/api/Users/login';
    try {
      // Login modelini oluştur
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type':
              'application/json', // JSON veri göndereceğimizi belirtiyoruz
        },
        body: json.encode({
          'Name': username, // C# backend'teki 'Name' alanına karşılık geli2yor
          'Password': password, // 'Password' alanı
        }),
      );

      if (response.statusCode == 200) {
        // Başarılı giriş
        return json
            .decode(response.body); // Backend'den gelen veriyi JSON'a çevir
      } else {
        // Hata durumunda
        return {'error': 'Invalid username or password'};
      }
    } catch (e) {
      return {'error': 'Error occurred: $e'};
    }
  }

  Future<int> loginState(final String userName, final String password) async {
    final loginService = LoginService();

    final response = await loginService.login(userName, password);

    if (response.containsKey('error')) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<void> resetPassword(String username, String newPassword) async {
    const url =
        'https://localhost:7072/api/Users/reset-password'; // Backend URL'nizi buraya ekleyin

    // Backend'e gönderilecek veriyi hazırlıyoruz
    final Map<String, String> data = {
      'UserName': username,
      'Password': newPassword,
    };

    // HTTP POST isteği gönderiyoruz
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json', // JSON veri gönderiyoruz
        },
        body: json.encode(data), // Veriyi JSON formatında gönderiyoruz
      );

      if (response.statusCode == 200) {
        // Başarılı şifre sıfırlama
        print('Password reset successfully!');
      } else {
        // Başarısız durum
        print('Error: ${response.body}');
      }
    } catch (error) {
      // Hata durumunda
      print('Error occurred: $error');
    }
  }

  Future<Map<String, dynamic>> signUp(String username) async {
    try {
      const String baseUrl = 'https://localhost:7072/api/Users/isUserName';
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type':
              'application/json', // JSON veri göndereceğimizi belirtiyoruz
        },
        body: json.encode({
          'Name': username, // C# backend'teki 'Name' alanına karşılık geli2yor
        }),
      );

      if (response.statusCode == 200) {
        // Başarılı giriş
        return json
            .decode(response.body); // Backend'den gelen veriyi JSON'a çevir
      } else {
        // Hata durumunda
        return {'error': 'Invalid username'};
      }
    } catch (e) {
      return {'error': 'Error occurred: $e'};
    }
  }

  Future<int> signState(final String userName) async {
    final loginService = LoginService();

    final response = await loginService.signUp(userName);

    if (response.containsKey('error')) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<String> addUserName(
      String username, String password, String email) async {
    const String url = 'https://localhost:7072/api/Users/addUser';
    // JSON formatında kullanıcı verilerini hazırlıyoruz
    final Map<String, dynamic> userData = {
      'Name': username,
      'Email': email,
      'Password': password,
    };

    try {
      // POST isteğini gönderiyoruz
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData),
      );

      // Sunucudan gelen cevabı kontrol ediyoruz
      if (response.statusCode == 200) {
        // Başarıyla kullanıcı eklendiğinde
        return "User successfully added!";
      } else if (response.statusCode == 401) {
        // Kullanıcı eklenemediğinde (örneğin kullanıcı adı zaten varsa)
        return "Username already exists.";
      } else {
        // Diğer durumlar için
        return "Failed to add user.";
      }
    } catch (e) {
      // Hata durumunda
      return "Error: $e";
    }
  }
}
