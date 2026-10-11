import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/networking/requests_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../account/data/models/account_details_model.dart';
import '../../../account/logic/cubit/profile_cubit.dart';
import 'home_top_bar_profile_info.dart';
import 'home_top_bar_shimmer.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ProfileCubit, RequestsState<AccountDetailsModel>>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const HomeTopBarShimmer(),
              success: (userData) {
                final name = userData.name ?? userData.username ?? '';
                final avatarPath = userData.avatar?.tmdb?.avatarPath;
                return HomeTopBarProfileInfo(
                  name: name,
                  avatarPath: avatarPath,
                );
              },
              orElse: () =>
                  const HomeTopBarProfileInfo(name: '', avatarPath: null),
            );
          },
        ),
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.primarySoft.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.favorites);
            },
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/heart.svg',
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.secondaryRed,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
