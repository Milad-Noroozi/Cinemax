import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../views/home_screen.dart';

class OnboardingController {
  final PageController pageController = PageController();
  int currentPage = 0;
  final List<OnboardingModel> pages = OnboardingModel.getOnboardingData();

  // Animation Controllers
  late AnimationController buttonAnimationController;
  late AnimationController progressAnimationController;
  late AnimationController floatingAnimationController;
  late AnimationController pageTransitionController;
  late AnimationController pulseAnimationController;

  // Animations
  late Animation<double> buttonScaleAnimation;
  late Animation<double> progressAnimation;
  late Animation<double> floatingAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> pulseAnimation;

  void initializeAnimations(TickerProvider vsync) {
    // Button Animation
    buttonAnimationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 200),
    );
    buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Progress Animation
    progressAnimationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 800),
    );
    progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: progressAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Floating Animation
    floatingAnimationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 3),
    );
    floatingAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(
        parent: floatingAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Page Transition Animation
    pageTransitionController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 600),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: pageTransitionController, curve: Curves.easeIn),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: pageTransitionController, curve: Curves.easeOut),
    );

    // Pulse Animation
    pulseAnimationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1500),
    );
    pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: pulseAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start initial animations
    pageTransitionController.forward();
    progressAnimationController.forward();
    floatingAnimationController.repeat(reverse: true);
    pulseAnimationController.repeat(reverse: true);
  }

  void onPageChanged(int index) {
    currentPage = index;
    // Reset and restart animations
    pageTransitionController.reset();
    progressAnimationController.reset();
    pageTransitionController.forward();
    progressAnimationController.forward();
  }

  void nextPage(BuildContext context) {
    if (currentPage < pages.length - 1) {
      // Reset and start animations for next page
      pageTransitionController.reset();
      progressAnimationController.reset();

      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      // Start animations after page change
      Future.delayed(Duration(milliseconds: 100), () {
        pageTransitionController.forward();
        progressAnimationController.forward();
      });
    } else {
      // Complete onboarding
      completeOnboarding(context);
    }
  }

  void skipToEnd(BuildContext context) {
    completeOnboarding(context);
  }

  void completeOnboarding(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void dispose() {
    pageController.dispose();
    buttonAnimationController.dispose();
    progressAnimationController.dispose();
    floatingAnimationController.dispose();
    pageTransitionController.dispose();
    pulseAnimationController.dispose();
  }
}