import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/app_image_provider.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class HomeTopBarProfileInfo extends StatelessWidget {
  static const int _avatarMemCacheSize = 120;

  final String name;
  final String? avatarPath;

  const HomeTopBarProfileInfo({super.key, required this.name, this.avatarPath});

  @override
  Widget build(BuildContext context) {
    final hasAvatar = avatarPath != null && avatarPath!.isNotEmpty;

    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.primarySoft,
          backgroundImage: hasAvatar
              ? appImageProvider(
                  '${ApiConstants.profileImagesUrl}$avatarPath',
                  maxWidth: _avatarMemCacheSize,
                )
              : null,
          child: !hasAvatar
              ? SvgPicture.asset(
                  AppAssets.personSvg,
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
