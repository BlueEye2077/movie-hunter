import 'package:flutter/material.dart';

import '../../../../core/theming/app_strings.dart';
import 'movie_info_chip.dart';
import 'movie_info_chip_shimmer.dart';
import 'movie_info_divider.dart';

class MovieInfoRow extends StatelessWidget {
  final String year;
  final String? formattedRuntime;
  final String? genre;
  final bool isLoading;

  const MovieInfoRow({
    super.key,
    required this.year,
    this.formattedRuntime,
    this.genre,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MovieInfoChip(icon: Icons.calendar_today, label: year),
        const MovieInfoDivider(),
        if (isLoading)
          const MovieInfoChipShimmer(icon: Icons.access_time)
        else
          MovieInfoChip(
            icon: Icons.access_time,
            label: formattedRuntime ?? AppStrings.notAvailableDash,
          ),
        const MovieInfoDivider(),
        if (isLoading)
          const MovieInfoChipShimmer(icon: Icons.movie_outlined)
        else
          MovieInfoChip(
            icon: Icons.movie_outlined,
            label: genre != null && genre!.isNotEmpty
                ? genre!
                : AppStrings.notAvailableDash,
          ),
      ],
    );
  }
}

