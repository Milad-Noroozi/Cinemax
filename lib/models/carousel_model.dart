// models/carousel_item.dart
class CarouselModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final String? description;

  CarouselModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.description,
  });
}