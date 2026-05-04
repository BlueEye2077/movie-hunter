import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import 'bottom_nav_item.dart';

class HomeBottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const HomeBottomNavBar({super.key, required this.onTabSelected});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;

  // List of navigation items
  static const List<_NavItem> _items = [
    _NavItem(icon: 'assets/svgs/home.svg', label: 'Home'),
    _NavItem(icon: 'assets/svgs/search.svg', label: 'Search'),
    _NavItem(icon: 'assets/svgs/download.svg', label: 'Download'),
    _NavItem(icon: 'assets/svgs/person.svg', label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    // Build the bottom navigation bar
    return Container(
      height: 72.h,
      color: AppColors.primaryDark,
      padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_items.length, (index) {
          final isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              _selectedIndex = index;
              widget.onTabSelected(index);
            },
            child: BottomNavItem(
              icon: _items[index].icon,
              label: _items[index].label,
              isSelected: isSelected,
            ),
          );
        }),
      ),
    );
  }
}

// Private class to hold the data for each navigation item
class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
