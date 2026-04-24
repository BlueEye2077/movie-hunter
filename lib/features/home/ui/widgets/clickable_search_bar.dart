import 'package:flutter/material.dart';
import 'package:movie_hunter/core/routing/routes.dart';
import 'package:movie_hunter/core/common/custom_search_bar.dart';

class ClickableSearchBar extends StatelessWidget {
  const ClickableSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Means the entire object is clickable
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pushNamed(context, Routes.search),
      child: Hero(
        tag: 'search_bar',
        // [Material] is required for the Hero animation to give the widget a physical surface
        child: Material(
          type: MaterialType.transparency,
          // [AbsorbPointer] disable the home search bar functionality as a text field
          child: const AbsorbPointer(child: CustomSearchBar()),
        ),
      ),
    );
  }
}
