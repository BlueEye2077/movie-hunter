// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountMoviesState()';
}


}

/// @nodoc
class $AccountMoviesStateCopyWith<$Res>  {
$AccountMoviesStateCopyWith(AccountMoviesState _, $Res Function(AccountMoviesState) __);
}


/// Adds pattern-matching-related methods to [AccountMoviesState].
extension AccountMoviesStatePatterns on AccountMoviesState {
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( List<MovieEntity> movies,  int totalResults,  bool isLoadingPagination,  NetworkExceptions? paginationError)?  success,TResult Function( NetworkExceptions error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.movies,_that.totalResults,_that.isLoadingPagination,_that.paginationError);case _Error() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( List<MovieEntity> movies,  int totalResults,  bool isLoadingPagination,  NetworkExceptions? paginationError)  success,required TResult Function( NetworkExceptions error)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Loading():
return loading();case _Success():
return success(_that.movies,_that.totalResults,_that.isLoadingPagination,_that.paginationError);case _Error():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( List<MovieEntity> movies,  int totalResults,  bool isLoadingPagination,  NetworkExceptions? paginationError)?  success,TResult? Function( NetworkExceptions error)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.movies,_that.totalResults,_that.isLoadingPagination,_that.paginationError);case _Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements AccountMoviesState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountMoviesState.idle()';
}


}




/// @nodoc


class _Loading implements AccountMoviesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountMoviesState.loading()';
}


}




/// @nodoc


class _Success implements AccountMoviesState {
  const _Success({required final  List<MovieEntity> movies, required this.totalResults, this.isLoadingPagination = false, this.paginationError}): _movies = movies;
  

 final  List<MovieEntity> _movies;
 List<MovieEntity> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

 final  int totalResults;
@JsonKey() final  bool isLoadingPagination;
 final  NetworkExceptions? paginationError;

/// Create a copy of AccountMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._movies, _movies)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&(identical(other.isLoadingPagination, isLoadingPagination) || other.isLoadingPagination == isLoadingPagination)&&(identical(other.paginationError, paginationError) || other.paginationError == paginationError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies),totalResults,isLoadingPagination,paginationError);

@override
String toString() {
  return 'AccountMoviesState.success(movies: $movies, totalResults: $totalResults, isLoadingPagination: $isLoadingPagination, paginationError: $paginationError)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AccountMoviesStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<MovieEntity> movies, int totalResults, bool isLoadingPagination, NetworkExceptions? paginationError
});


$NetworkExceptionsCopyWith<$Res>? get paginationError;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AccountMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,Object? totalResults = null,Object? isLoadingPagination = null,Object? paginationError = freezed,}) {
  return _then(_Success(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,isLoadingPagination: null == isLoadingPagination ? _self.isLoadingPagination : isLoadingPagination // ignore: cast_nullable_to_non_nullable
as bool,paginationError: freezed == paginationError ? _self.paginationError : paginationError // ignore: cast_nullable_to_non_nullable
as NetworkExceptions?,
  ));
}

/// Create a copy of AccountMoviesState
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


class _Error implements AccountMoviesState {
  const _Error(this.error);
  

 final  NetworkExceptions error;

/// Create a copy of AccountMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AccountMoviesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AccountMoviesStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 NetworkExceptions error
});


$NetworkExceptionsCopyWith<$Res> get error;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AccountMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as NetworkExceptions,
  ));
}

/// Create a copy of AccountMoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkExceptionsCopyWith<$Res> get error {
  
  return $NetworkExceptionsCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on

