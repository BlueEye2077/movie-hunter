import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class CastAndCrewListItem extends StatelessWidget {
  final String name;
  final String role;
  final String? profilePath;

  const CastAndCrewListItem({
    super.key,
    required this.name,
    required this.role,
    this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TextStyles.horizontalPadding,
        vertical: 8.h,
      ),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: 56.w,
              height: 56.w,
              child: profilePath != null
                  ? CachedNetworkImage(
                      imageUrl: '${ApiConstants.imagesUrl}$profilePath',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _avatarPlaceholder(),
                    )
                  : _avatarPlaceholder(),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  role,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font12Medium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatarPlaceholder() {
    return Container(
      color: AppColors.primarySoft,
      child: Icon(Icons.person, color: AppColors.textDarkGrey, size: 32.w),
    );
  }
}
