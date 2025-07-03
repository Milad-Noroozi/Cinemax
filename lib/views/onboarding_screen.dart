import 'package:flutter/material.dart';
import 'dart:math';
// import 'dart:ui' as ui;
import '../controllers/onboarding_controller.dart';
import '../models/onboarding_model.dart';
import '../widgets/animated_progress_border_painter.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController();
    _controller.initializeAnimations(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller.pageController,
                onPageChanged: (index) {
                  setState(() {
                    _controller.onPageChanged(index);
                  });
                },
                itemCount: _controller.pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_controller.pages[index], index);
                },
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingModel data, int index) {
    return AnimatedBuilder(
      animation: _controller.pageTransitionController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _controller.fadeAnimation,
          child: SlideTransition(
            position: _controller.slideAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background decorative elements with floating animation
                        if (!data.hasRatingCard)
                          _buildAnimatedDecorativeElements(),

                        // Main content container with gradient and image
                        AnimatedBuilder(
                          animation: _controller.floatingAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                0,
                                _controller.floatingAnimation.value,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: data.gradientColors,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      // Background Image
                                      Image.asset(
                                        data.imagePath,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: data.gradientColors,
                                              ),
                                            ),
                                            child: Center(
                                              child: AnimatedBuilder(
                                                animation:
                                                    _controller.pulseAnimation,
                                                builder: (context, child) {
                                                  return Transform.scale(
                                                    scale:
                                                        _controller
                                                            .pulseAnimation
                                                            .value,
                                                    child: Icon(
                                                      data.icon,
                                                      size: 100,
                                                      color: Colors.white
                                                          .withAlpha(
                                                            (255 * 0.9).round(),
                                                          ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      // Gradient Overlay
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withAlpha(
                                                (255 * 0.3).round(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        // Animated Rating and Duration cards
                        if (data.hasRatingCard) ...[
                          _buildAnimatedInfoCard(
                            data.rating ?? "Rating\n9/10",
                            Icons.star,
                            Alignment.topLeft,
                            delay: 200,
                          ),
                          _buildAnimatedInfoCard(
                            data.duration ?? "Duration\n1h 20m",
                            Icons.access_time,
                            Alignment.topRight,
                            delay: 400,
                          ),
                        ],
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        AnimatedBuilder(
                          animation: _controller.fadeAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _controller.fadeAnimation.value,
                              child: Text(
                                data.title,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        AnimatedBuilder(
                          animation: _controller.fadeAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _controller.fadeAnimation.value * 0.8,
                              child: Text(
                                data.subtitle,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[400],
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedInfoCard(
    String text,
    IconData icon,
    Alignment alignment, {
    required int delay,
  }) {
    return AnimatedBuilder(
      animation: _controller.pageTransitionController,
      builder: (context, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 600 + delay),
          curve: Curves.elasticOut,
          top: 20,
          left: alignment == Alignment.topLeft ? 20 : null,
          right: alignment == Alignment.topRight ? 20 : null,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 600 + delay),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A3E).withAlpha((255 * 0.9).round()),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withAlpha((255 * 0.2).round()),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((255 * 0.3).round()),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: Color(0xFF00E5FF), size: 16),
                      SizedBox(width: 8),
                      Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAnimatedDecorativeElements() {
    return AnimatedBuilder(
      animation: _controller.floatingAnimationController,
      builder: (context, child) {
        return Stack(
          children: [
            _buildFloatingCircle(Colors.orange, 20, 50, 30, null, right: 0),
            _buildFloatingCircle(
              Color(0xFF00E5FF),
              12,
              80,
              null,
              null,
              right: 40,
              delay: 0.5,
            ),
            _buildFloatingCircle(
              Color(0xFF00E5FF),
              15,
              null,
              50,
              100,
              delay: 1.0,
            ),
            _buildFloatingCircle(
              Colors.orange,
              18,
              null,
              null,
              150,
              right: 30,
              delay: 1.5,
            ),
            _buildFloatingCircle(
              Color(0xFF00E5FF),
              10,
              150,
              80,
              null,
              delay: 2.0,
            ),
            _buildFloatingCircle(
              Color(0xFF00E5FF),
              14,
              null,
              null,
              80,
              right: 80,
              delay: 2.5,
            ),
          ],
        );
      },
    );
  }

  Widget _buildFloatingCircle(
    Color color,
    double size,
    double? top,
    double? left,
    double? bottom, {
    double? right,
    double delay = 0,
  }) {
    final animationValue =
        sin((_controller.floatingAnimationController.value * 2 * pi) + delay) *
        5;

    return Positioned(
      top: top != null ? top + animationValue : null,
      left: left != null ? left + animationValue : null,
      bottom: bottom != null ? bottom + animationValue : null,
      right: right != null ? right + animationValue : null,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 1000 + (delay * 200).toInt()),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: color.withAlpha((255 * 0.8).round()),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withAlpha((255 * 0.4).round()),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildAnimatedPageIndicator(), _buildAnimatedNextButton()],
      ),
    );
  }

  Widget _buildAnimatedPageIndicator() {
    return Row(
      children: List.generate(_controller.pages.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: 8),
          width: index == _controller.currentPage ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color:
                index == _controller.currentPage
                    ? Color(0xFF00E5FF)
                    : Colors.grey[600],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildAnimatedNextButton() {
    return GestureDetector(
      onTapDown: (_) => _controller.buttonAnimationController.forward(),
      onTapUp: (_) {
        _controller.buttonAnimationController.reverse();
        _controller.nextPage(context);
      },
      onTapCancel: () => _controller.buttonAnimationController.reverse(),
      child: AnimatedBuilder(
        animation: _controller.buttonScaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _controller.buttonScaleAnimation.value,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Animated Progressive Border
                  AnimatedBuilder(
                    animation: _controller.progressAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(80, 80),
                        painter: AnimatedProgressiveBorderPainter(
                          currentPage: _controller.currentPage,
                          totalPages: _controller.pages.length,
                          borderColor: Color(0xFF00E5FF),
                          borderWidth: 3.0,
                          borderRadius: 20.0,
                          animationProgress:
                              _controller.progressAnimation.value,
                        ),
                      );
                    },
                  ),
                  // Main Button
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Color(0xFF00E5FF),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                            0xFF00E5FF,
                          ).withAlpha((255 * 0.4).round()),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        _controller.currentPage == _controller.pages.length - 1
                            ? Icons.check
                            : Icons.arrow_forward_ios,
                        color: Color(0xFF1A1A2E),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
