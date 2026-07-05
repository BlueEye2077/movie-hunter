import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/network_exceptions.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.idle() = Idle;
  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(Map<int, String> genreImages) = Success;
  const factory CategoriesState.error(NetworkExceptions networkExceptions) = Error;
}
