part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.idle() = _Idle;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.success(List<CategoryEntity> categories) =
      _Success;
  const factory CategoriesState.error(NetworkExceptions error) = _Error;
}

