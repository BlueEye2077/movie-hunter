import 'package:flutter/material.dart';

import '../../../../core/common/custom_search_bar.dart';
import '../../../../core/constants/hero_tags.dart';
import '../../../../core/routing/routes.dart';

class ClickableSearchBar extends StatelessWidget {
  const ClickableSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Means the entire object is clickable
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pushNamed(context, Routes.search),
      child: const Hero(
        tag: HeroTags.searchBar,
        // [Material] is required for the Hero animation to give the widget a physical surface
        child: Material(
          type: MaterialType.transparency,
          // [AbsorbPointer] disable the home search bar functionality as a text field
          child: AbsorbPointer(child: CustomSearchBar()),
        ),
      ),
    );
  }
}
