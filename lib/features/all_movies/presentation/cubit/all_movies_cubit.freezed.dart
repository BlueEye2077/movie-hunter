// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllMoviesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AllMoviesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AllMoviesState()';
  }
}

/// @nodoc
class Idle implements AllMoviesState {
  const Idle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AllMoviesState.idle()';
  }
}

/// @nodoc
class LoadingAllMovies implements AllMoviesState {
  const LoadingAllMovies();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingAllMovies);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AllMoviesState.loadingAllMovies()';
  }
}

/// @nodoc
class SuccessAllMovies implements AllMoviesState {
  const SuccessAllMovies(this.movies);

  final List<MovieEntity> movies;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessAllMovies &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'AllMoviesState.successAllMovies(movies: $movies)';
  }
}

/// @nodoc
class ErrorAllMovies implements AllMoviesState {
  const ErrorAllMovies(this.networkExceptions);

  final NetworkExceptions networkExceptions;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorAllMovies &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  @override
  String toString() {
    return 'AllMoviesState.errorAllMovies(networkExceptions: $networkExceptions)';
  }
}

/// @nodoc
class LoadingPaginationAllMovies implements AllMoviesState {
  const LoadingPaginationAllMovies(this.movies);

  final List<MovieEntity> movies;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingPaginationAllMovies &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'AllMoviesState.loadingPaginationAllMovies(movies: $movies)';
  }
}

/// @nodoc
class SuccessPaginationAllMovies implements AllMoviesState {
  const SuccessPaginationAllMovies(this.movies);

  final List<MovieEntity> movies;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessPaginationAllMovies &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'AllMoviesState.successPaginationAllMovies(movies: $movies)';
  }
}

/// @nodoc
class ErrorPaginationAllMovies implements AllMoviesState {
  const ErrorPaginationAllMovies(this.movies, this.networkExceptions);

  final List<MovieEntity> movies;
  final NetworkExceptions networkExceptions;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorPaginationAllMovies &&
            const DeepCollectionEquality().equals(other.movies, movies) &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(movies),
        networkExceptions,
      );

  @override
  String toString() {
    return 'AllMoviesState.errorPaginationAllMovies(movies: $movies, networkExceptions: $networkExceptions)';
  }
}
// dart format on
