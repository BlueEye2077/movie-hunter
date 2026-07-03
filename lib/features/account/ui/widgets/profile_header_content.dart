import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class ProfileHeaderContent extends StatelessWidget {
  final String name;
  final String username;
  final String? avatarPath;

  const ProfileHeaderContent({
    super.key,
    required this.name,
    required this.username,
    this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45.r,
          backgroundColor: AppColors.primarySoft,
          backgroundImage: avatarPath != null
              ? CachedNetworkImageProvider(
                  '${ApiConstants.imagesUrl}$avatarPath',
                )
              : null,
          child: avatarPath == null
              ? SvgPicture.asset(
                  'assets/svgs/person.svg',
                  width: 44.w,
                  height: 44.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textGrey,
                    BlendMode.srcIn,
                  ),
                )
              : null,
        ),
        SizedBox(height: 12.h),
        if (name.isNotEmpty)
          Text(
            name,
            style: TextStyles.font18SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        SizedBox(height: 4.h),
        if (username.isNotEmpty)
          Text(
            '@$username',
            style: TextStyles.font14Medium.copyWith(
              color: AppColors.textGrey,
            ),
          ),
      ],
    );
  }
}
