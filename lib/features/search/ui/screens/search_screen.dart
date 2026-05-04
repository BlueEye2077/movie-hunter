import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/cubit/search_cubit.dart';
import '../widgets/search_results.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/common/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    textController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Waits 500 milliseconds before sending a search request to the API, to avoid unnecessary API calls.
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        context.read<SearchCubit>().search(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar + Cancel
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: TextStyles.horizontalPadding,
                vertical: 16.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'search_bar',
                      child: Material(
                        type: MaterialType.transparency,
                        child: CustomSearchBar(
                          controller: textController,
                          onChanged: _onSearchChanged,
                          autofocus: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyles.font12Medium.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // Body
            Expanded(child: const SearchResults()),
          ],
        ),
      ),
    );
  }
}
