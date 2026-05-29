import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AllMoviesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isGridView;
  final ValueChanged<bool> onViewChanged;

  const AllMoviesAppBar({
    super.key,
    required this.title,
    required this.isGridView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryDark,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.textWhite,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.view_list_rounded,
            color: isGridView
                ? AppColors.textDarkGrey
                : AppColors.primaryBlueAccent,
          ),
          onPressed: () => onViewChanged(false),
        ),
        IconButton(
          icon: Icon(
            Icons.grid_view_rounded,
            color: isGridView
                ? AppColors.primaryBlueAccent
                : AppColors.textDarkGrey,
          ),
          onPressed: () => onViewChanged(true),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
