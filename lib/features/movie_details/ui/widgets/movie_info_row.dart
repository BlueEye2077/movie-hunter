import 'package:flutter/material.dart';

import 'movie_info_chip.dart';
import 'movie_info_chip_shimmer.dart';
import 'movie_info_divider.dart';

class MovieInfoRow extends StatelessWidget {
  final String? releaseDate;
  final int? runtime;
  final String? genre;

  const MovieInfoRow({super.key, this.releaseDate, this.runtime, this.genre});

  String _formatRuntime(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return hours > 0 ? '${hours}h ${mins}m' : '${mins}m';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MovieInfoChip(
          icon: Icons.calendar_today,
          label: releaseDate?.substring(0, 4) ?? '—',
        ),
        const MovieInfoDivider(),
        runtime != null
            ? MovieInfoChip(
                icon: Icons.access_time,
                label: _formatRuntime(runtime!),
              )
            : const MovieInfoChipShimmer(icon: Icons.access_time),
        const MovieInfoDivider(),
        genre != null
            ? MovieInfoChip(icon: Icons.movie_outlined, label: genre!)
            : const MovieInfoChipShimmer(icon: Icons.movie_outlined),
      ],
    );
  }
}
