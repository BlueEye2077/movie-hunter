import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theming/colors.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double progress; // 0.0 to 1.0

  const OnboardingNextButton({
    super.key,
    required this.onPressed,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 80.w,
        height: 80.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Custom Painter for the progress rounded rectangle
            // Wrap the CustomPaint with a TweenAnimationBuilder for smooth progress animation!
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(
                milliseconds: 1000,
              ), // Match the speed of your slider dots
              curve: Curves.easeOut,
              builder: (context, animatedProgress, child) {
                return CustomPaint(
                  size: Size(80.w, 80.w),
                  painter: _RoundedRectProgressPainter(
                    progress:
                        animatedProgress, // Now we pass the animated floating number
                    strokeWidth: 3.w,
                    trackColor: AppColors
                        .primarySoft, // Assuming track needs to blend nicely
                    progressColor: AppColors.primaryBlueAccent,
                    radius: 20.r,
                  ),
                );
              },
            ),
            // Inner filled button
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: AppColors.primaryBlueAccent,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 2, // Rotate 180 degrees
                  child: SvgPicture.asset(
                    'assets/svgs/arrow_back.svg',
                    height: 24.w,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textBlack, // very dark blue
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundedRectProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color trackColor;
  final Color progressColor;
  final double radius;

  _RoundedRectProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.trackColor,
    required this.progressColor,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= strokeWidth || size.height <= strokeWidth) return;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // Draw track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawRRect(rrect, trackPaint);

    // Draw progress
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = Path()..addRRect(rrect);

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-pi / 2);
    canvas.translate(-size.width / 2, -size.height / 2);

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      final extractPath = metric.extractPath(0, metric.length * progress);
      canvas.drawPath(extractPath, progressPaint);
      break; // Only need the first path metric
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _RoundedRectProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.radius != radius;
  }
}
