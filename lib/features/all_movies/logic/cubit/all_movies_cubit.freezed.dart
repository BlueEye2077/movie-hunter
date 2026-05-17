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
mixin _$AllMoviesState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllMoviesState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState<$T>()';
}


}

/// @nodoc
class $AllMoviesStateCopyWith<T,$Res>  {
$AllMoviesStateCopyWith(AllMoviesState<T> _, $Res Function(AllMoviesState<T>) __);
}


/// Adds pattern-matching-related methods to [AllMoviesState].
extension AllMoviesStatePatterns<T> on AllMoviesState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle<T> value)?  idle,TResult Function( Loading<T> value)?  loading,TResult Function( LoadingAllMovies<T> value)?  loadingAllMovies,TResult Function( LoadingPaginationAllMovies<T> value)?  loadingPaginationAllMovies,TResult Function( SuccessPaginationAllMovies<T> value)?  successPaginationAllMovies,TResult Function( SuccessAllMovies<T> value)?  successAllMovies,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Loading() when loading != null:
return loading(_that);case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies(_that);case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies(_that);case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle<T> value)  idle,required TResult Function( Loading<T> value)  loading,required TResult Function( LoadingAllMovies<T> value)  loadingAllMovies,required TResult Function( LoadingPaginationAllMovies<T> value)  loadingPaginationAllMovies,required TResult Function( SuccessPaginationAllMovies<T> value)  successPaginationAllMovies,required TResult Function( SuccessAllMovies<T> value)  successAllMovies,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case Loading():
return loading(_that);case LoadingAllMovies():
return loadingAllMovies(_that);case LoadingPaginationAllMovies():
return loadingPaginationAllMovies(_that);case SuccessPaginationAllMovies():
return successPaginationAllMovies(_that);case SuccessAllMovies():
return successAllMovies(_that);case Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle<T> value)?  idle,TResult? Function( Loading<T> value)?  loading,TResult? Function( LoadingAllMovies<T> value)?  loadingAllMovies,TResult? Function( LoadingPaginationAllMovies<T> value)?  loadingPaginationAllMovies,TResult? Function( SuccessPaginationAllMovies<T> value)?  successPaginationAllMovies,TResult? Function( SuccessAllMovies<T> value)?  successAllMovies,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Loading() when loading != null:
return loading(_that);case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies(_that);case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies(_that);case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function()?  loadingAllMovies,TResult Function()?  loadingPaginationAllMovies,TResult Function( T data)?  successPaginationAllMovies,TResult Function( T data)?  successAllMovies,TResult Function( NetworkExceptions networkExceptions)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Loading() when loading != null:
return loading();case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies();case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies();case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that.data);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that.data);case Error() when error != null:
return error(_that.networkExceptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function()  loadingAllMovies,required TResult Function()  loadingPaginationAllMovies,required TResult Function( T data)  successPaginationAllMovies,required TResult Function( T data)  successAllMovies,required TResult Function( NetworkExceptions networkExceptions)  error,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case Loading():
return loading();case LoadingAllMovies():
return loadingAllMovies();case LoadingPaginationAllMovies():
return loadingPaginationAllMovies();case SuccessPaginationAllMovies():
return successPaginationAllMovies(_that.data);case SuccessAllMovies():
return successAllMovies(_that.data);case Error():
return error(_that.networkExceptions);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function()?  loadingAllMovies,TResult? Function()?  loadingPaginationAllMovies,TResult? Function( T data)?  successPaginationAllMovies,TResult? Function( T data)?  successAllMovies,TResult? Function( NetworkExceptions networkExceptions)?  error,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Loading() when loading != null:
return loading();case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies();case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies();case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that.data);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that.data);case Error() when error != null:
return error(_that.networkExceptions);case _:
  return null;

}
}

}

/// @nodoc


class Idle<T> implements AllMoviesState<T> {
  const Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState<$T>.idle()';
}


}




/// @nodoc


class Loading<T> implements AllMoviesState<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState<$T>.loading()';
}


}




/// @nodoc


class LoadingAllMovies<T> implements AllMoviesState<T> {
  const LoadingAllMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAllMovies<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState<$T>.loadingAllMovies()';
}


}




/// @nodoc


class LoadingPaginationAllMovies<T> implements AllMoviesState<T> {
  const LoadingPaginationAllMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPaginationAllMovies<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState<$T>.loadingPaginationAllMovies()';
}


}




/// @nodoc


class SuccessPaginationAllMovies<T> implements AllMoviesState<T> {
  const SuccessPaginationAllMovies(this.data);
  

 final  T data;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessPaginationAllMoviesCopyWith<T, SuccessPaginationAllMovies<T>> get copyWith => _$SuccessPaginationAllMoviesCopyWithImpl<T, SuccessPaginationAllMovies<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessPaginationAllMovies<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AllMoviesState<$T>.successPaginationAllMovies(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessPaginationAllMoviesCopyWith<T,$Res> implements $AllMoviesStateCopyWith<T, $Res> {
  factory $SuccessPaginationAllMoviesCopyWith(SuccessPaginationAllMovies<T> value, $Res Function(SuccessPaginationAllMovies<T>) _then) = _$SuccessPaginationAllMoviesCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SuccessPaginationAllMoviesCopyWithImpl<T,$Res>
    implements $SuccessPaginationAllMoviesCopyWith<T, $Res> {
  _$SuccessPaginationAllMoviesCopyWithImpl(this._self, this._then);

  final SuccessPaginationAllMovies<T> _self;
  final $Res Function(SuccessPaginationAllMovies<T>) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(SuccessPaginationAllMovies<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class SuccessAllMovies<T> implements AllMoviesState<T> {
  const SuccessAllMovies(this.data);
  

 final  T data;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessAllMoviesCopyWith<T, SuccessAllMovies<T>> get copyWith => _$SuccessAllMoviesCopyWithImpl<T, SuccessAllMovies<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAllMovies<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AllMoviesState<$T>.successAllMovies(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessAllMoviesCopyWith<T,$Res> implements $AllMoviesStateCopyWith<T, $Res> {
  factory $SuccessAllMoviesCopyWith(SuccessAllMovies<T> value, $Res Function(SuccessAllMovies<T>) _then) = _$SuccessAllMoviesCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SuccessAllMoviesCopyWithImpl<T,$Res>
    implements $SuccessAllMoviesCopyWith<T, $Res> {
  _$SuccessAllMoviesCopyWithImpl(this._self, this._then);

  final SuccessAllMovies<T> _self;
  final $Res Function(SuccessAllMovies<T>) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(SuccessAllMovies<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Error<T> implements AllMoviesState<T> {
  const Error(this.networkExceptions);
  

 final  NetworkExceptions networkExceptions;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.networkExceptions, networkExceptions) || other.networkExceptions == networkExceptions));
}


@override
int get hashCode => Object.hash(runtimeType,networkExceptions);

@override
String toString() {
  return 'AllMoviesState<$T>.error(networkExceptions: $networkExceptions)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $AllMoviesStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 NetworkExceptions networkExceptions
});


$NetworkExceptionsCopyWith<$Res> get networkExceptions;

}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? networkExceptions = null,}) {
  return _then(Error<T>(
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
