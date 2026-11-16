import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../person_details/presentation/models/person_details_args.dart';
import '../../domain/entities/credit_entity.dart';
import '../../domain/entities/movie_credits_entity.dart';
import '../widgets/cast_and_crew_list_item.dart';

class CastAndCrewScreen extends StatelessWidget {
  final MovieCreditsEntity credits;

  const CastAndCrewScreen({super.key, required this.credits});

  @override
  Widget build(BuildContext context) {
    final directors = credits.directors;
    final writers = credits.writers;
    final cast = credits.cast;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.castAndCrew,
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          if (directors.isNotEmpty) ...[
            const _SectionHeaderSliver(title: AppStrings.directors),
            _CreditsSliverList(items: directors),
          ],
          if (writers.isNotEmpty) ...[
            const _SectionHeaderSliver(title: AppStrings.writers),
            _CreditsSliverList(items: writers),
          ],
          if (cast.isNotEmpty) ...[
            const _SectionHeaderSliver(title: AppStrings.cast),
            _CreditsSliverList(items: cast),
          ],
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
        ],
      ),
    );
  }
}

class _SectionHeaderSliver extends StatelessWidget {
  final String title;

  const _SectionHeaderSliver({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.horizontalPadding,
          right: AppSpacing.horizontalPadding,
          top: 16.h,
          bottom: 8.h,
        ),
        child: Text(
          title,
          style: TextStyles.font16SemiBold.copyWith(
            color: AppColors.primaryBlueAccent,
          ),
        ),
      ),
    );
  }
}

class _CreditsSliverList extends StatelessWidget {
  final List<CreditEntity> items;

  const _CreditsSliverList({required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final member = items[index];
        return CastAndCrewListItem(
          name: member.name,
          role: member.role,
          profilePath: member.profilePath,
          onTap: member.id > 0
              ? () => Navigator.pushNamed(
                    context,
                    Routes.personDetails,
                    arguments: PersonDetailsArgs(
                      id: member.id,
                      name: member.name,
                    ),
                  )
              : null,
        );
      },
    );
  }
}

