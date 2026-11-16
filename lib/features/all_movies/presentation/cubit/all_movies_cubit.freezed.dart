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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState()';
}


}

/// @nodoc
class $AllMoviesStateCopyWith<$Res>  {
$AllMoviesStateCopyWith(AllMoviesState _, $Res Function(AllMoviesState) __);
}


/// Adds pattern-matching-related methods to [AllMoviesState].
extension AllMoviesStatePatterns on AllMoviesState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( LoadingAllMovies value)?  loadingAllMovies,TResult Function( SuccessAllMovies value)?  successAllMovies,TResult Function( ErrorAllMovies value)?  errorAllMovies,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies(_that);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that);case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( LoadingAllMovies value)  loadingAllMovies,required TResult Function( SuccessAllMovies value)  successAllMovies,required TResult Function( ErrorAllMovies value)  errorAllMovies,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case LoadingAllMovies():
return loadingAllMovies(_that);case SuccessAllMovies():
return successAllMovies(_that);case ErrorAllMovies():
return errorAllMovies(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( LoadingAllMovies value)?  loadingAllMovies,TResult? Function( SuccessAllMovies value)?  successAllMovies,TResult? Function( ErrorAllMovies value)?  errorAllMovies,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies(_that);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that);case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loadingAllMovies,TResult Function( List<MovieEntity> movies,  NetworkExceptions? paginationError,  bool isLoadingPagination)?  successAllMovies,TResult Function( NetworkExceptions networkExceptions)?  errorAllMovies,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies();case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that.movies,_that.paginationError,_that.isLoadingPagination);case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that.networkExceptions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loadingAllMovies,required TResult Function( List<MovieEntity> movies,  NetworkExceptions? paginationError,  bool isLoadingPagination)  successAllMovies,required TResult Function( NetworkExceptions networkExceptions)  errorAllMovies,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case LoadingAllMovies():
return loadingAllMovies();case SuccessAllMovies():
return successAllMovies(_that.movies,_that.paginationError,_that.isLoadingPagination);case ErrorAllMovies():
return errorAllMovies(_that.networkExceptions);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loadingAllMovies,TResult? Function( List<MovieEntity> movies,  NetworkExceptions? paginationError,  bool isLoadingPagination)?  successAllMovies,TResult? Function( NetworkExceptions networkExceptions)?  errorAllMovies,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies();case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that.movies,_that.paginationError,_that.isLoadingPagination);case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that.networkExceptions);case _:
  return null;

}
}

}

/// @nodoc


class Idle implements AllMoviesState {
  const Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAllMovies);
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
  const SuccessAllMovies({required final  List<MovieEntity> movies, this.paginationError, this.isLoadingPagination = false}): _movies = movies;
  

 final  List<MovieEntity> _movies;
 List<MovieEntity> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

 final  NetworkExceptions? paginationError;
@JsonKey() final  bool isLoadingPagination;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessAllMoviesCopyWith<SuccessAllMovies> get copyWith => _$SuccessAllMoviesCopyWithImpl<SuccessAllMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAllMovies&&const DeepCollectionEquality().equals(other._movies, _movies)&&(identical(other.paginationError, paginationError) || other.paginationError == paginationError)&&(identical(other.isLoadingPagination, isLoadingPagination) || other.isLoadingPagination == isLoadingPagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies),paginationError,isLoadingPagination);

@override
String toString() {
  return 'AllMoviesState.successAllMovies(movies: $movies, paginationError: $paginationError, isLoadingPagination: $isLoadingPagination)';
}


}

/// @nodoc
abstract mixin class $SuccessAllMoviesCopyWith<$Res> implements $AllMoviesStateCopyWith<$Res> {
  factory $SuccessAllMoviesCopyWith(SuccessAllMovies value, $Res Function(SuccessAllMovies) _then) = _$SuccessAllMoviesCopyWithImpl;
@useResult
$Res call({
 List<MovieEntity> movies, NetworkExceptions? paginationError, bool isLoadingPagination
});


$NetworkExceptionsCopyWith<$Res>? get paginationError;

}
/// @nodoc
class _$SuccessAllMoviesCopyWithImpl<$Res>
    implements $SuccessAllMoviesCopyWith<$Res> {
  _$SuccessAllMoviesCopyWithImpl(this._self, this._then);

  final SuccessAllMovies _self;
  final $Res Function(SuccessAllMovies) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,Object? paginationError = freezed,Object? isLoadingPagination = null,}) {
  return _then(SuccessAllMovies(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,paginationError: freezed == paginationError ? _self.paginationError : paginationError // ignore: cast_nullable_to_non_nullable
as NetworkExceptions?,isLoadingPagination: null == isLoadingPagination ? _self.isLoadingPagination : isLoadingPagination // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkExceptionsCopyWith<$Res>? get paginationError {
    if (_self.paginationError == null) {
    return null;
  }

  return $NetworkExceptionsCopyWith<$Res>(_self.paginationError!, (value) {
    return _then(_self.copyWith(paginationError: value));
  });
}
}

/// @nodoc


class ErrorAllMovies implements AllMoviesState {
  const ErrorAllMovies(this.networkExceptions);
  

 final  NetworkExceptions networkExceptions;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAllMoviesCopyWith<ErrorAllMovies> get copyWith => _$ErrorAllMoviesCopyWithImpl<ErrorAllMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAllMovies&&(identical(other.networkExceptions, networkExceptions) || other.networkExceptions == networkExceptions));
}


@override
int get hashCode => Object.hash(runtimeType,networkExceptions);

@override
String toString() {
  return 'AllMoviesState.errorAllMovies(networkExceptions: $networkExceptions)';
}


}

/// @nodoc
abstract mixin class $ErrorAllMoviesCopyWith<$Res> implements $AllMoviesStateCopyWith<$Res> {
  factory $ErrorAllMoviesCopyWith(ErrorAllMovies value, $Res Function(ErrorAllMovies) _then) = _$ErrorAllMoviesCopyWithImpl;
@useResult
$Res call({
 NetworkExceptions networkExceptions
});


$NetworkExceptionsCopyWith<$Res> get networkExceptions;

}
/// @nodoc
class _$ErrorAllMoviesCopyWithImpl<$Res>
    implements $ErrorAllMoviesCopyWith<$Res> {
  _$ErrorAllMoviesCopyWithImpl(this._self, this._then);

  final ErrorAllMovies _self;
  final $Res Function(ErrorAllMovies) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? networkExceptions = null,}) {
  return _then(ErrorAllMovies(
null == networkExceptions ? _self.networkExceptions : networkExceptions // ignore: cast_nullable_to_non_nullable
as NetworkExceptions,
  ));
}

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkExceptionsCopyWith<$Res> get networkExceptions {
  
  return $NetworkExceptionsCopyWith<$Res>(_self.networkExceptions, (value) {
    return _then(_self.copyWith(networkExceptions: value));
  });
}
}

// dart format on
