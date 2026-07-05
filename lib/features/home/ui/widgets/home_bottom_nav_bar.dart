import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class HomeBottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const HomeBottomNavBar({super.key, required this.onTabSelected});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      backgroundColor: AppColors.primaryDark,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTabSelected(index);
      },
      option: BubbleBarOptions(
        barStyle: BubbleBarStyle.horizontal,
        bubbleFillStyle: BubbleFillStyle.fill,
        opacity: 1.0,
      ),
      items: [
        BottomBarItem(
          backgroundColor: AppColors.primarySoft,
          icon: SvgPicture.asset(
            'assets/svgs/home.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.textGrey,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            'assets/svgs/home.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryBlueAccent,
              BlendMode.srcIn,
            ),
          ),
          selectedColor: AppColors.primarySoft,
          unSelectedColor: AppColors.textGrey,
          title: Text(
            'Home',
            style: TextStyles.font12Medium.copyWith(
              color: AppColors.primaryBlueAccent,
            ),
          ),
        ),
        BottomBarItem(
          backgroundColor: AppColors.primarySoft,
          icon: SvgPicture.asset(
            'assets/svgs/category.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.textGrey,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            'assets/svgs/category.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryBlueAccent,
              BlendMode.srcIn,
            ),
          ),
          selectedColor: AppColors.primarySoft,
          unSelectedColor: AppColors.textGrey,
          title: Text(
            'Categories',
            style: TextStyles.font12Medium.copyWith(
              color: AppColors.primaryBlueAccent,
            ),
          ),
        ),
        BottomBarItem(
          backgroundColor: AppColors.primarySoft,
          icon: SvgPicture.asset(
            'assets/svgs/person.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.textGrey,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            'assets/svgs/person.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryBlueAccent,
              BlendMode.srcIn,
            ),
          ),
          selectedColor: AppColors.primarySoft,
          unSelectedColor: AppColors.textGrey,
          title: Text(
            'Profile',
            style: TextStyles.font12Medium.copyWith(
              color: AppColors.primaryBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
