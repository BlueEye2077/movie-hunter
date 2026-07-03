import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class MovieCastItem extends StatelessWidget {
  final String name;
  final String role;
  final String? profilePath;

  const MovieCastItem({
    super.key,
    required this.name,
    required this.role,
    this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      child: Row(
        children: [
          // Avatar
          ClipOval(
            child: SizedBox(
              width: 40.w,
              height: 40.w,
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
          SizedBox(width: 8.w),
          // Name and role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14SemiBold.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
                Text(
                  role,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font10Medium.copyWith(
                    color: AppColors.textGrey,
                  ),
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
      child: Icon(Icons.person, color: AppColors.textDarkGrey, size: 24.w),
    );
  }
}
