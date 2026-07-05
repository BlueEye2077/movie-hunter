import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movie_circle_action_button.dart';
import 'play_trailer_button.dart';
import 'watchlist_toggle_button.dart';

class MovieActionButtons extends StatelessWidget {
  final int movieId;

  const MovieActionButtons({super.key, required this.movieId});

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
            // TODO: Download
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
            // TODO: Share
          },
        ),
      ],
    );
  }
}
