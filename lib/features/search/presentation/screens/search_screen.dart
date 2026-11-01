import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/custom_search_bar.dart';
import '../../../../core/constants/hero_tags.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    context.read<SearchCubit>().onQueryChanged(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalPadding,
                vertical: 16.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: HeroTags.searchBar,
                      child: Material(
                        type: MaterialType.transparency,
                        child: CustomSearchBar(
                          controller: _textController,
                          onChanged: _onSearchChanged,
                          autofocus: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      AppStrings.cancel,
                      style: TextStyles.font12Medium.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            const Expanded(child: SearchResults()),
          ],
        ),
      ),
    );
  }
}

