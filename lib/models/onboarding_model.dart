import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color primaryColor;
  final String? rating;
  final String? duration;
  final bool hasRatingCard;
  final IconData icon;
  final List<Color> gradientColors;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.primaryColor,
    this.rating,
    this.duration,
    this.hasRatingCard = false,
    required this.icon,
    required this.gradientColors,
  });

  static List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        title: "Lorem ipsum dolor sit amet consectetur esplicit",
        subtitle:
            "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.",
        imagePath: "assets/images/-see-tv-series.jpg",
        primaryColor: Color(0xFF00E5FF),
        rating: "Rating\n8.5/10",
        duration: "Duration\n1h 20m",
        hasRatingCard: true,
        icon: Icons.movie_outlined,
        gradientColors: [Color(0xFF667eea), Color(0xFF764ba2)],
      ),
      OnboardingModel(
        title: "Lorem ipsum dolor sit amet consectetur esplicit",
        subtitle:
            "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.",
        imagePath: "assets/images/breaking-bad-image.jpg",
        primaryColor: Color(0xFF00E5FF),
        rating: "Rating\n9/10",
        duration: "Duration\n1h 20m",
        hasRatingCard: true,
        icon: Icons.local_movies,
        gradientColors: [Color(0xFFf093fb), Color(0xFFf5576c)],
      ),
      OnboardingModel(
        title: "Lorem ipsum dolor sit amet consectetur esplicit",
        subtitle:
            "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.",
        imagePath: "assets/images/game-of-thrones.jpg",
        primaryColor: Color(0xFFFF9800),
        hasRatingCard: false,
        icon: Icons.phone_android_outlined,
        gradientColors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
      ),
    ];
  }
}