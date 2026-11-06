import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_network_image.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../domain/entities/person_details_entity.dart';
import 'person_stat_chip.dart';

class PersonInfoHeader extends StatelessWidget {
  final PersonDetailsEntity person;

  const PersonInfoHeader({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final age = person.age;

    return Padding(
      padding: AppSpacing.screenPadding,
      child: Center(
        child: Column(
          children: [
            _PersonAvatar(profilePath: person.profilePath),
            SizedBox(height: 16.h),
            Text(
              person.name,
              textAlign: TextAlign.center,
              style: TextStyles.font18SemiBold,
            ),
            if (person.knownForDepartment != null) ...[
              SizedBox(height: 4.h),
              Text(person.knownForDepartment!, style: TextStyles.font12Medium),
            ],
            SizedBox(height: 20.h),
            // Stats chips (wrap to a new line instead of overflowing)
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.w,
              runSpacing: 8.h,
              children: [
                if (person.formattedBirthday != null)
                  PersonStatChip(
                    icon: Icons.cake_outlined,
                    label: person.formattedBirthday!,
                  ),
                if (age != null)
                  PersonStatChip(
                    icon: Icons.hourglass_bottom_outlined,
                    label: person.isDeceased
                        ? AppStrings.diedAt(age)
                        : AppStrings.yearsOld(age),
                  ),
                if (person.placeOfBirth != null)
                  PersonStatChip(
                    icon: Icons.place_outlined,
                    label: person.placeOfBirth!,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonAvatar extends StatelessWidget {
  final String? profilePath;

  const _PersonAvatar({required this.profilePath});

  /// Decoded image width in physical pixels (~110 logical px at 3x DPR).
  static const int _memCacheWidth = 330;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 110.w,
        height: 110.w,
        child: profilePath != null
            ? AppNetworkImage(
                imageUrl: '${ApiConstants.imagesUrl}$profilePath',
                memCacheWidth: _memCacheWidth,
                fit: BoxFit.cover,
                errorWidget: (_, _) => const _AvatarPlaceholder(),
              )
            : const _AvatarPlaceholder(),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primarySoft,
      child: Icon(Icons.person, color: AppColors.textDarkGrey, size: 48.w),
    );
  }
}

