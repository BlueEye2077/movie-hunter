import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_network_image.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class MovieCastItem extends StatelessWidget {
  final String name;
  final String role;
  final String? profilePath;
  final VoidCallback? onTap;

  const MovieCastItem({
    super.key,
    required this.name,
    required this.role,
    this.profilePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140.w,
        child: Row(
          children: [
            ClipOval(
              child: SizedBox(
                width: 40.r,
                height: 40.r,
                child: profilePath != null && profilePath!.trim().isNotEmpty
                    ? AppNetworkImage(
                        imageUrl: '${ApiConstants.profileImagesUrl}$profilePath',
                        memCacheWidth: 120,
                        fit: BoxFit.cover,
                        errorWidget: (context, error) => _avatarPlaceholder(),
                      )
                    : _avatarPlaceholder(),
              ),
            ),
            SizedBox(width: 8.w),
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
      ),
    );
  }

  Widget _avatarPlaceholder() {
    return Container(
      color: AppColors.primarySoft,
      child: Icon(Icons.person, color: AppColors.textDarkGrey, size: 24.r),
    );
  }
}

