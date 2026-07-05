import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../logic/cubit/movie_trailer_cubit.dart';

class PlayTrailerButton extends StatelessWidget {
  final int movieId;

  const PlayTrailerButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieTrailerCubit>(),
      child: BlocConsumer<MovieTrailerCubit, RequestsState<String>>(
        listener: (context, state) {
          state.whenOrNull(
            success: (youtubeKey) async {
              final url = Uri.parse('https://www.youtube.com/watch?v=$youtubeKey');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Could not launch YouTube"),
                      backgroundColor: AppColors.secondaryRed,
                    ),
                  );
                }
              }
            },
            error: (failure) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(NetworkExceptions.getErrorMessage(failure)),
                  backgroundColor: AppColors.secondaryRed,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return ElevatedButton.icon(
            onPressed: state.maybeWhen(
              loading: () => null,
              orElse: () => () {
                context.read<MovieTrailerCubit>().getMovieTrailer(movieId);
              },
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryOrange,
              foregroundColor: AppColors.textWhite,
              shape: const StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            icon: state.maybeWhen(
              loading: () => SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.textWhite,
                ),
              ),
              orElse: () => Icon(Icons.play_arrow, size: 24.w),
            ),
            label: Text(AppStrings.play, style: TextStyles.font16Medium),
          );
        },
      ),
    );
  }
}
