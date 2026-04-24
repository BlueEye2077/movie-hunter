import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/features/home/data/models/actor.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class SearchActorItem extends StatelessWidget {
  final Actor actor;

  const SearchActorItem({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w, // Fixed width to handle text wrapping properly
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
            child: actor.profilePath != null
                ? CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w200${actor.profilePath}',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, color: AppColors.textGrey),
                  )
                : const Icon(Icons.person, color: AppColors.textGrey),
          ),
          SizedBox(height: 8.h),
          Text(
            actor.name ?? actor.originalName ?? 'Unknown',
            style: TextStyles.font12Medium.copyWith(color: AppColors.textWhite),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
