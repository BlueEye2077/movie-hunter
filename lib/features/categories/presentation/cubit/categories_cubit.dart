import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesCubit({required GetCategoriesUseCase getCategoriesUseCase})
    : _getCategoriesUseCase = getCategoriesUseCase,
      super(const CategoriesState.idle());

  Future<void> getCategories() async {
    if (state is _Success || state is _Loading) return;
    emit(const CategoriesState.loading());

    final result = await _getCategoriesUseCase();
    if (isClosed) return;

    result.when(
      success: (categories) => emit(CategoriesState.success(categories)),
      failure: (networkExceptions) =>
          emit(CategoriesState.error(networkExceptions)),
    );
  }
}

