import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/core/theming/styles.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;

  final List<_NavItem> _items = [
    _NavItem(icon: 'assets/svgs/home.svg', label: 'Home'),
    _NavItem(icon: 'assets/svgs/search.svg', label: 'Search'),
    _NavItem(icon: 'assets/svgs/download.svg', label: 'Download'),
    _NavItem(icon: 'assets/svgs/person.svg', label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      color: AppColors.primaryDark,
      padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_items.length, (index) {
          final isSelected = index == _selectedIndex;
          return GestureDetector(
            // todo: add navigation to the selected item
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primarySoft : Colors.transparent,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    _items[index].icon,
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? AppColors.primaryBlueAccent
                          : AppColors.textGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                  if (isSelected) ...[
                    SizedBox(width: 4.w),
                    Text(
                      _items[index].label,
                      style: TextStyles.font12Medium.copyWith(
                        color: AppColors.primaryBlueAccent,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
