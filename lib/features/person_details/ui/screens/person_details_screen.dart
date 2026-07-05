import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/person_details_response.dart';
import '../../logic/cubit/person_details_cubit.dart';
import '../widgets/person_details_shimmer.dart';
import '../widgets/personal_details_content.dart';

class PersonDetailsScreen extends StatefulWidget {
  final int personId;
  final String personName;

  const PersonDetailsScreen({
    super.key,
    required this.personId,
    required this.personName,
  });

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PersonDetailsCubit>().getPersonDetails(widget.personId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.personName,
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
        centerTitle: true,
      ),
      body:
          BlocBuilder<PersonDetailsCubit, RequestsState<PersonDetailsResponse>>(
            builder: (context, state) {
              return state.when(
                idle: () => const SizedBox.shrink(),
                loading: () => const PersonDetailsShimmer(),
                success: (person) => PersonDetailsContent(person: person),
                error: (error) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Text(
                      NetworkExceptions.getErrorMessage(error),
                      textAlign: TextAlign.center,
                      style: TextStyles.font14Regular,
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}
