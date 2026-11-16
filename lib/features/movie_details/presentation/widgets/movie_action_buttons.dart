import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_strings.dart';
import 'movie_circle_action_button.dart';
import 'play_trailer_button.dart';
import 'watchlist_toggle_button.dart';

class MovieActionButtons extends StatelessWidget {
  final int movieId;
  final String movieTitle;

  const MovieActionButtons({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayTrailerButton(movieId: movieId),
        SizedBox(width: 16.w),
        WatchlistToggleButton(movieId: movieId),
        SizedBox(width: 16.w),
        MovieCircleActionButton(
          icon: Icons.share,
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text: AppStrings.shareMovieMessage(
                  movieTitle,
                  ApiConstants.tmdbMovieWebUrl(movieId),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

