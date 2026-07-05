import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

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
        // Play button (Extracted to its own widget for cleanliness)
        PlayTrailerButton(movieId: movieId),

        SizedBox(width: 16.w),

        // Download button
        MovieCircleActionButton(
          icon: Icons.download_outlined,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Downloading is not supported in this demo'),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),

        SizedBox(width: 16.w),

        // Watchlist button (Extracted to its own widget for cleanliness)
        WatchlistToggleButton(movieId: movieId),

        SizedBox(width: 16.w),

        // Share button
        MovieCircleActionButton(
          icon: Icons.share,
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text:
                    '🍿 Grab some popcorn! Check out "$movieTitle" on Movie Hunter! 🎬\nhttps://www.themoviedb.org/movie/$movieId',
              ),
            );
          },
        ),
      ],
    );
  }
}
