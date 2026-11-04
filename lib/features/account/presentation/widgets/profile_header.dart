import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/account_details_cubit.dart';
import 'profile_header_content.dart';
import 'profile_header_shimmer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const ProfileHeaderShimmer(),
          success: (account) => ProfileHeaderContent(
            name: account.displayName,
            username: account.username,
            avatarPath: account.avatarPath,
          ),
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

