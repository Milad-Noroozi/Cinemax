import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AnimatedProgressiveBorderPainter extends CustomPainter {
  final int currentPage;
  final int totalPages;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double animationProgress;

  AnimatedProgressiveBorderPainter({
    required this.currentPage,
    required this.totalPages,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.animationProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint completePaint =
        Paint()
          ..color = borderColor
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final Paint activePaint =
        Paint()
          ..color = borderColor.withAlpha((255 * 0.3).round())
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final double margin = borderWidth / 2;
    final RRect borderRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        margin,
        margin,
        size.width - borderWidth,
        size.height - borderWidth,
      ),
      Radius.circular(borderRadius),
    );

    final Path borderPath = Path()..addRRect(borderRect);
    final ui.PathMetrics pathMetrics = borderPath.computeMetrics();

    for (ui.PathMetric pathMetric in pathMetrics) {
      final double pathLength = pathMetric.length;
      final int segments = totalPages;
      final double gapPercentage = 0.05;
      final double segmentPercentage =
          (1.0 - (gapPercentage * segments)) / segments;

      for (int i = 0; i < segments; i++) {
        final double segmentStart = i * (segmentPercentage + gapPercentage);
        final double segmentEnd = segmentStart + segmentPercentage;

        final double startPosition = segmentStart * pathLength;
        final double endPosition = segmentEnd * pathLength;

        if (startPosition < pathLength) {
          final double actualEndPosition =
              endPosition > pathLength ? pathLength : endPosition;

          if (i < currentPage) {
            // Complete segments
            final Path extractedPath = pathMetric.extractPath(
              startPosition,
              actualEndPosition,
            );
            canvas.drawPath(extractedPath, completePaint);
          } else if (i == currentPage) {
            // Current segment with animation
            final double animatedEndPosition =
                startPosition +
                ((actualEndPosition - startPosition) * animationProgress);

            if (animatedEndPosition > startPosition) {
              final Path extractedPath = pathMetric.extractPath(
                startPosition,
                animatedEndPosition,
              );
              canvas.drawPath(extractedPath, completePaint);
            }

            // Show remaining part with transparency
            if (animatedEndPosition < actualEndPosition) {
              final Path remainingPath = pathMetric.extractPath(
                animatedEndPosition,
                actualEndPosition,
              );
              canvas.drawPath(remainingPath, activePaint);
            }
          } else {
            // Future segments with transparency
            final Path extractedPath = pathMetric.extractPath(
              startPosition,
              actualEndPosition,
            );
            canvas.drawPath(extractedPath, activePaint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is AnimatedProgressiveBorderPainter &&
        (oldDelegate.currentPage != currentPage ||
            oldDelegate.totalPages != totalPages ||
            oldDelegate.animationProgress != animationProgress);
  }
}
