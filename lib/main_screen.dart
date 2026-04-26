import 'package:flutter/material.dart';
import 'core/common/placeholder_tab.dart';
import 'core/theming/colors.dart';
import 'features/home/ui/screens/home_screen.dart';
import 'features/home/ui/widgets/home_bottom_nav_bar.dart';
import 'features/home/ui/widgets/home_tab_bloc_providers.dart';

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

          // Tab 1 — Search: accessed via pushed route from search bar
          // TODO: create the screen
          PlaceholderTab(label: 'Search'),

          // Tab 2 — Downloads: placeholder
          // TODO: create the screen
          PlaceholderTab(label: 'Downloads'),

          // Tab 3 — Profile: placeholder
          // TODO: create the screen
          PlaceholderTab(label: 'Profile'),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: HomeBottomNavBar(
        onTabSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
