import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class MovieInfoDivider extends StatelessWidget {
  const MovieInfoDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      height: 16.h,
      width: 1,
      color: AppColors.textDarkGrey,
    );
  }
}
