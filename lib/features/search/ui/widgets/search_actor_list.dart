import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/features/home/data/models/actor.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

import 'package:movie_hunter/features/search/ui/widgets/search_actor_item.dart';

class SearchActorList extends StatelessWidget {
  final List<Actor> actors;

  const SearchActorList({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    if (actors.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: TextStyles.horizontalPadding,
            right: TextStyles.horizontalPadding,
            bottom: 16.h,
          ),
          child: Text(
            'Actors',
            style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
          ),
        ),
        SizedBox(
          height: 90.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: actors.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final actor = actors[index];
              return SearchActorItem(actor: actor);
            },
          ),
        ),
      ],
    );
  }
}
