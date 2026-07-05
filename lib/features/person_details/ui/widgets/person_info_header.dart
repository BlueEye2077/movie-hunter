import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'stats_chip.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/person_details_response.dart';

class PersonInfoHeader extends StatelessWidget {
  final PersonDetailsResponse person;

  const PersonInfoHeader({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TextStyles.horizontalPadding),
      child: Column(
        children: [
          // Avatar
          ClipOval(
            child: SizedBox(
              width: 110.w,
              height: 110.w,
              child: person.profilePath != null
                  ? CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.imagesUrl}${person.profilePath}',
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _placeholder(),
                    )
                  : _placeholder(),
            ),
          ),
          SizedBox(height: 16.h),
          // Name
          Text(
            person.name ?? '',
            textAlign: TextAlign.center,
            style: TextStyles.font18SemiBold,
          ),
          if (person.knownForDepartment != null) ...[
            SizedBox(height: 4.h),
            Text(person.knownForDepartment!, style: TextStyles.font12Medium),
          ],
          SizedBox(height: 20.h),
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (person.birthday != null)
                StatChip(
                  icon: Icons.cake_outlined,
                  label: _formatDate(person.birthday!),
                ),
              if (person.birthday != null && person.placeOfBirth != null)
                SizedBox(width: 16.w),
              if (person.placeOfBirth != null)
                Flexible(
                  child: StatChip(
                    icon: Icons.place_outlined,
                    label: person.placeOfBirth!,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _placeholder() => Container(
    color: AppColors.primarySoft,
    child: Icon(Icons.person, color: AppColors.textDarkGrey, size: 48.w),
  );

  String _formatDate(String date) {
    try {
      final parts = date.split('-');
      if (parts.length < 3) return date;
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      final monthIndex = int.parse(parts[1]) - 1;
      return '${months[monthIndex]} ${parts[2]}, ${parts[0]}';
    } catch (_) {
      return date;
    }
  }
}


