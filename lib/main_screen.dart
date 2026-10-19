import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'core/theming/colors.dart';
import 'features/account/ui/screens/profile_screen.dart';
import 'features/account/ui/widgets/profile_tab_bloc_providers.dart';
import 'features/categories/presentation/cubit/categories_cubit.dart';
import 'features/categories/presentation/screens/categories_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/presentation/widgets/home_tab_bloc_providers.dart';
import 'main_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<bool> _visitedTabs = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Tab 0 — Home (always visited first)
          const HomeTabBlocProviders(child: HomeScreen()),

          // Tab 1 — Categories (only built after first visit)
          _visitedTabs[1]
              ? BlocProvider(
                  create: (_) => getIt<CategoriesCubit>()..getCategories(),
                  child: const CategoriesScreen(),
                )
              : const SizedBox.shrink(),

          // Tab 2 — Profile (only built after first visit)
          _visitedTabs[2]
              ? const ProfileTabBlocProviders(child: ProfileScreen())
              : const SizedBox.shrink(),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: MainBottomNavBar(
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
            _visitedTabs[index] = true;
          });
        },
      ),
    );
  }
}
