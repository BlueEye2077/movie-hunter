import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/strings.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/cast_member.dart';
import '../../data/models/crew_member.dart';
import '../widgets/cast_and_crew_list_item.dart';

class CastAndCrewScreen extends StatelessWidget {
  final List<CastMember> cast;
  final List<CrewMember> crew;

  const CastAndCrewScreen({super.key, required this.cast, required this.crew});

  @override
  Widget build(BuildContext context) {
    final directors = crew.where((c) => c.job == CrewMember.jobDirector).toList();
    final writers = crew
        .where((c) => c.job == CrewMember.jobWriter || c.job == CrewMember.jobScreenplay)
        .toList();

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
          style: TextStyles.font16SemiBold.copyWith(
            color: AppColors.textWhite,
          ),
        ),
      ),
      body: ListView(
        children: [
          if (directors.isNotEmpty) ...[
            _buildSectionHeader(AppStrings.directors),
            ...directors.map(_buildCrewItem),
          ],
          if (writers.isNotEmpty) ...[
            _buildSectionHeader(AppStrings.writers),
            ...writers.map(_buildCrewItem),
          ],
          if (cast.isNotEmpty) ...[
            _buildSectionHeader(AppStrings.cast),
            ...cast.map(_buildCastItem),
          ],
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(
        left: TextStyles.horizontalPadding,
        right: TextStyles.horizontalPadding,
        top: 16.h,
        bottom: 8.h,
      ),
      child: Text(
        title,
        style: TextStyles.font16SemiBold.copyWith(
          color: AppColors.primaryBlueAccent,
        ),
      ),
    );
  }

  Widget _buildCrewItem(CrewMember member) {
    return CastAndCrewListItem(
      name: member.name ?? '',
      role: member.job ?? '',
      profilePath: member.profilePath,
    );
  }

  Widget _buildCastItem(CastMember member) {
    return CastAndCrewListItem(
      name: member.name ?? '',
      role: member.character ?? '',
      profilePath: member.profilePath,
    );
  }
}
