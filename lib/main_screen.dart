import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/di/dependency_injection.dart';
import 'package:movie_hunter/core/theming/colors.dart';
import 'package:movie_hunter/features/home/logic/cubit/genres_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/now_playing_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/popular_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/top_rated_movies_cubit.dart';
import 'package:movie_hunter/features/home/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movie_hunter/features/home/ui/screens/home_screen.dart';
import 'package:movie_hunter/features/home/ui/widgets/home_bottom_nav_bar.dart';

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
        children: [
          // Tab 0 — Home: all movie-list cubits scoped here
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    getIt<UpComingMoviesCubit>()..getUpComingMovies(),
              ),
              BlocProvider(
                create: (_) => getIt<PopularMoviesCubit>()..getPopularMovies(),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<TopRatedMoviesCubit>()..getTopRatedMovies(),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<NowPlayingMoviesCubit>()..getNowPlayingMovies(),
              ),
              BlocProvider(create: (_) => getIt<GenresCubit>()..getGenres()),
            ],
            child: const HomeScreen(),
          ),

          // Tab 1 — Search: accessed via pushed route from search bar
          // TODO: creat the screen
          const _PlaceholderTab(label: 'Search'),

          // Tab 2 — Downloads: placeholder
          // TODO: creat the screen
          const _PlaceholderTab(label: 'Downloads'),

          // Tab 3 — Profile: placeholder
          // TODO: creat the screen
          const _PlaceholderTab(label: 'Profile'),
        ],
      ),
      bottomNavigationBar: HomeBottomNavBar(
        onTabSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}

// TODO: Remove this class with acuall screen
class _PlaceholderTab extends StatelessWidget {
  final String label;

  const _PlaceholderTab({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(color: Colors.white54, fontSize: 18),
      ),
    );
  }
}
