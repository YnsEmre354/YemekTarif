class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;

  UserModel({this.id, this.name, this.email, this.password});

  // JSON'dan dart objesine dönüşüm
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'].trim(),
        email: json['email'].trim(),
        password: json['password'].trim());
  }
}
