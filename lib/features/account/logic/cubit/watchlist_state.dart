import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/network_exceptions.dart';

part 'watchlist_state.freezed.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = _Initial;
  const factory WatchlistState.loading() = Loading;
  const factory WatchlistState.success(bool isWatchlisted) = Success;
  const factory WatchlistState.error(NetworkExceptions networkExceptions) = Error;
}
