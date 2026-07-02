import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class HomeTopBarProfileInfo extends StatelessWidget {
  final String name;
  final String? avatarPath;

  const HomeTopBarProfileInfo({super.key, required this.name, this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.primarySoft,
          backgroundImage: avatarPath != null
              ? CachedNetworkImageProvider(
                  '${ApiConstants.imagesUrl}$avatarPath',
                )
              : null,
          child: avatarPath == null
              ? SvgPicture.asset(
                  'assets/svgs/person.svg',
                  width: 24.w,
                  height: 24.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textGrey,
                    BlendMode.srcIn,
                  ),
                )
              : null,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name.isEmpty
                      ? AppStrings.helloGuestUser
                      : AppStrings.helloUser,
                  style: TextStyles.font16SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
                if (name.isNotEmpty)
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        name,
                        speed: const Duration(milliseconds: 150),
                        textStyle: TextStyles.font22CaveatPrimary,
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(AppStrings.letsStream, style: TextStyles.font12Medium),
          ],
        ),
      ],
    );
  }
}
