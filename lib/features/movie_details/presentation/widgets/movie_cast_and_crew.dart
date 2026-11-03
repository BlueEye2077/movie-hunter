import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../person_details/presentation/models/person_details_args.dart';
import '../../domain/entities/movie_credits_entity.dart';
import '../models/cast_and_crew_args.dart';
import 'movie_cast_item.dart';

class MovieCastAndCrew extends StatelessWidget {
  final MovieCreditsEntity credits;

  const MovieCastAndCrew({super.key, required this.credits});

  @override
  Widget build(BuildContext context) {
    final highlights = credits.highlights;
    if (highlights.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.castAndCrew,
                style: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.castAndCrew,
                    arguments: CastAndCrewArgs(credits: credits),
                  );
                },
                child: Text(
                  AppStrings.seeAll,
                  style: TextStyles.font14Medium.copyWith(
                    color: AppColors.primaryBlueAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 44.r,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: highlights.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                final credit = highlights[index];
                return MovieCastItem(
                  name: credit.name,
                  role: credit.role,
                  profilePath: credit.profilePath,
                  onTap: credit.id > 0
                      ? () => Navigator.pushNamed(
                            context,
                            Routes.personDetails,
                            arguments: PersonDetailsArgs(
                              id: credit.id,
                              name: credit.name,
                            ),
                          )
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

