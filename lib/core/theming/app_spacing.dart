import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppSpacing {
  // Base raw values
  static const double horizontal = 24.0;

  // Responsive getters for combined other dynamic padding values
  static double get horizontalPadding => horizontal.w;

  // Reusable padding helpers
  static EdgeInsets get screenPadding =>
      EdgeInsets.symmetric(horizontal: horizontalPadding);
}
