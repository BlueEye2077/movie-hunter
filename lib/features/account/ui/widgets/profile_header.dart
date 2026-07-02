import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/requests_state.dart';
import '../../data/models/account_details_model.dart';
import '../../logic/cubit/profile_cubit.dart';
import 'profile_header_content.dart';
import 'profile_header_shimmer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, RequestsState<AccountDetailsModel>>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const ProfileHeaderShimmer(),
          success: (userData) {
            final name = userData.name ?? userData.username ?? '';
            final username = userData.username ?? '';
            final avatarPath = userData.avatar?.tmdb?.avatarPath;
            return ProfileHeaderContent(
              name: name,
              username: username,
              avatarPath: avatarPath,
            );
          },
          orElse: () => const ProfileHeaderContent(
            name: '',
            username: '',
            avatarPath: null,
          ),
        );
      },
    );
  }
}
