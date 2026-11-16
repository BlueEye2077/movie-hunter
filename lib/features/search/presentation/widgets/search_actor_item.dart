import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../person_details/presentation/models/person_details_args.dart';
import '../../domain/entities/person_entity.dart';

class SearchActorItem extends StatelessWidget {
  final PersonEntity actor;

  const SearchActorItem({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.personDetails,
          arguments: PersonDetailsArgs(id: actor.id, name: actor.name),
        );
      },
      child: SizedBox(
        width: 72.w,
        child: Column(
          children: [
            Container(
              width: 64.w,
              height: 64.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primarySoft,
              ),
              clipBehavior: Clip.hardEdge,
              child: (actor.profilePath != null &&
                      actor.profilePath!.trim().isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.profileImagesUrl}${actor.profilePath}',
                      fit: BoxFit.cover,
                      memCacheWidth: 192,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, color: AppColors.textGrey),
                    )
                  : const Icon(Icons.person, color: AppColors.textGrey),
            ),
            SizedBox(height: 8.h),
            Text(
              actor.name.isNotEmpty ? actor.name : AppStrings.unknown,
              style: TextStyles.font12Medium.copyWith(
                color: AppColors.textWhite,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

