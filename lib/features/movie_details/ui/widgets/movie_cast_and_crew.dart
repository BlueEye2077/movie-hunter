import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/cast_and_crew_args.dart';
import '../../data/models/cast_member.dart';
import '../../data/models/crew_member.dart';
import 'movie_cast_item.dart';

class MovieCastAndCrew extends StatelessWidget {
  final List<CastMember> cast;
  final List<CrewMember> crew;

  const MovieCastAndCrew({super.key, required this.cast, required this.crew});

  @override
  Widget build(BuildContext context) {
    // Combine directors/writers from crew with the cast
    final directors = crew.where((c) => c.job == 'Director').toList();
    final writers = crew
        .where((c) => c.job == 'Writer' || c.job == 'Screenplay')
        .toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TextStyles.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cast and Crew',
                style: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              // See All Movies Button
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.castAndCrew,
                    arguments: CastAndCrewArgs(cast: cast, crew: crew),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyles.font14Medium.copyWith(
                    color: AppColors.primaryBlueAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              // Can override the padding
              clipBehavior: Clip.none,
              itemCount: directors.length + writers.length + cast.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                if (index < directors.length) {
                  final director = directors[index];
                  return MovieCastItem(
                    name: director.name ?? '',
                    role: 'Director',
                    profilePath: director.profilePath,
                  );
                }
                final writerIndex = index - directors.length;
                if (writerIndex < writers.length) {
                  final writer = writers[writerIndex];
                  return MovieCastItem(
                    name: writer.name ?? '',
                    role: writer.job ?? 'Writer',
                    profilePath: writer.profilePath,
                  );
                }
                final castIndex = writerIndex - writers.length;
                final castMember = cast[castIndex];
                return MovieCastItem(
                  name: castMember.name ?? '',
                  role: castMember.character ?? '',
                  profilePath: castMember.profilePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
