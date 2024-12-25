class FoodModel {
  final int? id;
  final String? name;

  FoodModel({this.id, this.name});

  // JSON'dan dart objesine dönüşüm
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'],
      name: json['name'].trim(), // Boşlukları temizlemek için trim() kullandım
    );
  }
}
