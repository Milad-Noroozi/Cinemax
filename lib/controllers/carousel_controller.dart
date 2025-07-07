import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemax/models/carousel_model.dart';

class CarouselController extends ChangeNotifier {
  int _currentIndex = 0;
  final CarouselSliderController _carouselSliderController = CarouselSliderController();
  final List<CarouselModel> _carouselModels = [
    CarouselModel(
      title: "Game Of Thrones: Full serial",
      subtitle: "On March 2, 2022",
      imagePath:
          "assets/images/Sliders/home_screen_slider/game-of-thrones-wallpaper.jpg",
    ),
    CarouselModel(
      title: "John Wick: No censorship",
      subtitle: "On March 2, 2022",
      imagePath: "assets/images/Sliders/home_screen_slider/john-wick.jpg",
    ),
    CarouselModel(
      title: "Money Heist",
      subtitle: "On March 2, 2022",
      imagePath: "assets/images/Sliders/home_screen_slider/Money-Heist.jpg",
    ),
  ];

  int get currentIndex => _currentIndex;
  List<CarouselModel> get carouselItems => _carouselModels;
  CarouselSliderController get carouselController => _carouselSliderController;

  // Methods
  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextSlide() {
    _carouselSliderController.nextPage();
  }

  void previousSlide() {
    _carouselSliderController.previousPage();
  }

  void goToSlide(int index) {
    _carouselSliderController.animateToPage(index);
  }
}