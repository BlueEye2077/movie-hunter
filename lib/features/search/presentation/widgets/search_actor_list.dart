import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../domain/entities/person_entity.dart';
import 'search_actor_item.dart';
import 'search_section_header.dart';

class SearchActorList extends StatelessWidget {
  final List<PersonEntity> actors;

  const SearchActorList({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchSectionHeader(title: AppStrings.actors),
        SizedBox(
          height: 90.h,
          child: ListView.separated(
            padding: AppSpacing.screenPadding,
            scrollDirection: Axis.horizontal,
            itemCount: actors.length,
            separatorBuilder: (_, _) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return SearchActorItem(actor: actors[index]);
            },
          ),
        ),
      ],
    );
  }
}

