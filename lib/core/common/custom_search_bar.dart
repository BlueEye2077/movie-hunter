import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool autofocus;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.only(left: 16.w, right: 4.w),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/search.svg',
            width: 16.w,
            height: 16.w,
            colorFilter: ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              autofocus: autofocus,
              style: TextStyles.font14Medium.copyWith(
                color: AppColors.textWhite,
              ),
              decoration: InputDecoration(
                hintText: 'Search a title..',
                hintStyle: TextStyles.font14Medium.copyWith(
                  color: AppColors.textGrey,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          IconButton(
            onPressed: () => controller?.clear(),
            icon: Icon(Icons.close, color: AppColors.textGrey, size: 20.r),
          ),
        ],
      ),
    );
  }
}
