import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../home/data/models/genre.dart';
import '../../../home/logic/cubit/genres_cubit.dart';
import '../../logic/cubit/categories_cubit.dart';
import '../../logic/cubit/categories_state.dart';
import '../widgets/categories_grid_view.dart';
import '../widgets/categories_shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CategoriesCubit>()),
        BlocProvider.value(value: getIt<GenresCubit>()),
      ],
      child: const _CategoriesScreenContent(),
    );
  }
}

class _CategoriesScreenContent extends StatefulWidget {
  const _CategoriesScreenContent();

  @override
  State<_CategoriesScreenContent> createState() =>
      _CategoriesScreenContentState();
}

class _CategoriesScreenContentState extends State<_CategoriesScreenContent> {
  @override
  void initState() {
    super.initState();
    _fetchGenreImages();
  }

  void _fetchGenreImages() {
    final genresState = context.read<GenresCubit>().state;
    genresState.maybeWhen(
      success: (genres) {
        context.read<CategoriesCubit>().fetchGenreImages(genres);
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.textWhite),
        ),
      ),
      body: BlocConsumer<GenresCubit, RequestsState<List<Genre>>>(
        listener: (context, state) {
          state.maybeWhen(
            success: (genres) {
              context.read<CategoriesCubit>().fetchGenreImages(genres);
            },
            orElse: () {},
          );
        },
        builder: (context, genresState) {
          return genresState.when(
            idle: () => const CategoriesShimmer(),
            loading: () => const CategoriesShimmer(),
            error: (err) => Center(
              child: Text(
                'Failed to load genres',
                style: TextStyles.font16SemiBold,
              ),
            ),
            success: (genres) {
              return BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, catState) {
                  final Map<int, String> imagesMap = catState.maybeWhen(
                    success: (images) => images,
                    orElse: () => {},
                  );

                  return CategoriesGridView(
                    genres: genres,
                    imagesMap: imagesMap,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
