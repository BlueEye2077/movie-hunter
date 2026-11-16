import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import 'core/theming/app_assets.dart';
import 'core/theming/app_strings.dart';
import 'core/theming/colors.dart';
import 'core/theming/text_styles.dart';

class MainBottomNavBar extends StatelessWidget {
  static const List<_NavBarItem> _items = [
    _NavBarItem(iconPath: AppAssets.homeSvg, label: AppStrings.home),
    _NavBarItem(iconPath: AppAssets.categorySvg, label: AppStrings.categories),
    _NavBarItem(iconPath: AppAssets.personSvg, label: AppStrings.profile),
  ];

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  void _handleTap(int index) {
    if (index != currentIndex) {
      onTabSelected(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double bottomInset = MediaQuery.paddingOf(context).bottom;
    final double additionalBottomPadding = math.max(bottomInset - 8.0, 0.0) + 6.0;

    return Semantics(
      explicitChildNodes: true,
      child: Material(
        color: AppColors.primaryDark,
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: additionalBottomPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _items.length,
                  (index) => _BubbleNavItem(
                    item: _items[index],
                    isSelected: currentIndex == index,
                    onTap: () => _handleTap(index),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BubbleNavItem extends StatelessWidget {
  static const BorderRadius _pillRadius = BorderRadius.horizontal(
    left: Radius.circular(52.0),
    right: Radius.circular(52.0),
  );

  final _NavBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _BubbleNavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(end: isSelected ? 1.75 : 1.15),
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      builder: (context, flex, child) {
        return Expanded(
          flex: (flex * 1000.0).round(),
          child: child!,
        );
      },
      child: Semantics(
        container: true,
        button: true,
        selected: isSelected,
        label: item.label,
        child: InkWell(
          onTap: onTap,
          borderRadius: _pillRadius,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            height: 48.0,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: _pillRadius,
              color: isSelected ? AppColors.primarySoft : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  item.iconPath,
                  width: 24.w,
                  height: 24.w,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? AppColors.primaryBlueAccent
                        : AppColors.textGrey,
                    BlendMode.srcIn,
                  ),
                ),
                Flexible(
                  child: AnimatedCrossFade(
                    alignment: Alignment.center,
                    firstChild: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: ExcludeSemantics(
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font12Medium.copyWith(
                            color: AppColors.primaryBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                    duration: const Duration(milliseconds: 200),
                    sizeCurve: Curves.fastOutSlowIn,
                    firstCurve: Curves.fastOutSlowIn,
                    secondCurve: Curves.fastOutSlowIn.flipped,
                    crossFadeState: isSelected
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem {
  final String iconPath;
  final String label;

  const _NavBarItem({required this.iconPath, required this.label});
}
