import 'package:flutter/material.dart';

import 'core/theming/colors.dart';
import 'features/account/ui/screens/profile_screen.dart';
import 'features/account/ui/widgets/profile_tab_bloc_providers.dart';
import 'features/categories/ui/screens/categories_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          // Widget with all the bloc providers for the home tab
          HomeTabBlocProviders(child: HomeScreen()),

          // Tab 1 — Categories
          CategoriesScreen(),

          // Tab 2 — Profile
          ProfileTabBlocProviders(child: ProfileScreen()),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: MainBottomNavBar(
        onTabSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
