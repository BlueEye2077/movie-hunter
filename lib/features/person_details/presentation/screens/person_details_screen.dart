import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_retry_view.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../cubit/person_details_cubit.dart';
import '../models/person_details_args.dart';
import '../widgets/person_details_content.dart';
import '../widgets/person_details_shimmer.dart';

class PersonDetailsScreen extends StatelessWidget {
  final PersonDetailsArgs args;

  const PersonDetailsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textWhite,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          args.name,
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
        builder: (context, state) {
          return state.when(
            idle: () => const SizedBox.shrink(),
            loading: () => const PersonDetailsShimmer(),
            success: (person) => PersonDetailsContent(person: person),
            error: (error) => ErrorRetryView(
              message: NetworkExceptions.getErrorMessage(error),
              onRetry: () => context
                  .read<PersonDetailsCubit>()
                  .getPersonDetails(args.id),
            ),
          );
        },
      ),
    );
  }
}
