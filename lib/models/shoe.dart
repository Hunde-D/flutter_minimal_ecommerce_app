import 'dart:math';

class Shoe {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;

  Shoe({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  }) : id = '${DateTime.now().toIso8601String()}_${Random().nextInt(1000)}';
}

  // factory Shoe.fromJson(Map<String, dynamic> json) {
  //   return Shoe(
  //     name: json['name'],
  //     image: json['image'],
  //     description: json['description'],
  //     price: json['price'].toDouble(),
  //   );
  // }