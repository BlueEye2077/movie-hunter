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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle<T> value)?  idle,TResult Function( LoadingAllMovies<T> value)?  loadingAllMovies,TResult Function( SuccessAllMovies<T> value)?  successAllMovies,TResult Function( ErrorAllMovies<T> value)?  errorAllMovies,TResult Function( LoadingPaginationAllMovies<T> value)?  loadingPaginationAllMovies,TResult Function( SuccessPaginationAllMovies<T> value)?  successPaginationAllMovies,TResult Function( ErrorPaginationAllMovies<T> value)?  errorPaginationAllMovies,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies(_that);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that);case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that);case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies(_that);case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that);case ErrorPaginationAllMovies() when errorPaginationAllMovies != null:
return errorPaginationAllMovies(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle<T> value)  idle,required TResult Function( LoadingAllMovies<T> value)  loadingAllMovies,required TResult Function( SuccessAllMovies<T> value)  successAllMovies,required TResult Function( ErrorAllMovies<T> value)  errorAllMovies,required TResult Function( LoadingPaginationAllMovies<T> value)  loadingPaginationAllMovies,required TResult Function( SuccessPaginationAllMovies<T> value)  successPaginationAllMovies,required TResult Function( ErrorPaginationAllMovies<T> value)  errorPaginationAllMovies,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case LoadingAllMovies():
return loadingAllMovies(_that);case SuccessAllMovies():
return successAllMovies(_that);case ErrorAllMovies():
return errorAllMovies(_that);case LoadingPaginationAllMovies():
return loadingPaginationAllMovies(_that);case SuccessPaginationAllMovies():
return successPaginationAllMovies(_that);case ErrorPaginationAllMovies():
return errorPaginationAllMovies(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle<T> value)?  idle,TResult? Function( LoadingAllMovies<T> value)?  loadingAllMovies,TResult? Function( SuccessAllMovies<T> value)?  successAllMovies,TResult? Function( ErrorAllMovies<T> value)?  errorAllMovies,TResult? Function( LoadingPaginationAllMovies<T> value)?  loadingPaginationAllMovies,TResult? Function( SuccessPaginationAllMovies<T> value)?  successPaginationAllMovies,TResult? Function( ErrorPaginationAllMovies<T> value)?  errorPaginationAllMovies,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies(_that);case SuccessAllMovies() when successAllMovies != null:
return successAllMovies(_that);case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that);case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies(_that);case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that);case ErrorPaginationAllMovies() when errorPaginationAllMovies != null:
return errorPaginationAllMovies(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loadingAllMovies,TResult Function()?  successAllMovies,TResult Function( NetworkExceptions networkExceptions)?  errorAllMovies,TResult Function()?  loadingPaginationAllMovies,TResult Function( T data)?  successPaginationAllMovies,TResult Function( NetworkExceptions networkExceptions)?  errorPaginationAllMovies,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies();case SuccessAllMovies() when successAllMovies != null:
return successAllMovies();case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that.networkExceptions);case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies();case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that.data);case ErrorPaginationAllMovies() when errorPaginationAllMovies != null:
return errorPaginationAllMovies(_that.networkExceptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loadingAllMovies,required TResult Function()  successAllMovies,required TResult Function( NetworkExceptions networkExceptions)  errorAllMovies,required TResult Function()  loadingPaginationAllMovies,required TResult Function( T data)  successPaginationAllMovies,required TResult Function( NetworkExceptions networkExceptions)  errorPaginationAllMovies,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case LoadingAllMovies():
return loadingAllMovies();case SuccessAllMovies():
return successAllMovies();case ErrorAllMovies():
return errorAllMovies(_that.networkExceptions);case LoadingPaginationAllMovies():
return loadingPaginationAllMovies();case SuccessPaginationAllMovies():
return successPaginationAllMovies(_that.data);case ErrorPaginationAllMovies():
return errorPaginationAllMovies(_that.networkExceptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loadingAllMovies,TResult? Function()?  successAllMovies,TResult? Function( NetworkExceptions networkExceptions)?  errorAllMovies,TResult? Function()?  loadingPaginationAllMovies,TResult? Function( T data)?  successPaginationAllMovies,TResult? Function( NetworkExceptions networkExceptions)?  errorPaginationAllMovies,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case LoadingAllMovies() when loadingAllMovies != null:
return loadingAllMovies();case SuccessAllMovies() when successAllMovies != null:
return successAllMovies();case ErrorAllMovies() when errorAllMovies != null:
return errorAllMovies(_that.networkExceptions);case LoadingPaginationAllMovies() when loadingPaginationAllMovies != null:
return loadingPaginationAllMovies();case SuccessPaginationAllMovies() when successPaginationAllMovies != null:
return successPaginationAllMovies(_that.data);case ErrorPaginationAllMovies() when errorPaginationAllMovies != null:
return errorPaginationAllMovies(_that.networkExceptions);case _:
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


class SuccessAllMovies<T> implements AllMoviesState<T> {
  const SuccessAllMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAllMovies<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllMoviesState<$T>.successAllMovies()';
}


}




/// @nodoc


class ErrorAllMovies<T> implements AllMoviesState<T> {
  const ErrorAllMovies(this.networkExceptions);
  

 final  NetworkExceptions networkExceptions;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAllMoviesCopyWith<T, ErrorAllMovies<T>> get copyWith => _$ErrorAllMoviesCopyWithImpl<T, ErrorAllMovies<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAllMovies<T>&&(identical(other.networkExceptions, networkExceptions) || other.networkExceptions == networkExceptions));
}


@override
int get hashCode => Object.hash(runtimeType,networkExceptions);

@override
String toString() {
  return 'AllMoviesState<$T>.errorAllMovies(networkExceptions: $networkExceptions)';
}


}

/// @nodoc
abstract mixin class $ErrorAllMoviesCopyWith<T,$Res> implements $AllMoviesStateCopyWith<T, $Res> {
  factory $ErrorAllMoviesCopyWith(ErrorAllMovies<T> value, $Res Function(ErrorAllMovies<T>) _then) = _$ErrorAllMoviesCopyWithImpl;
@useResult
$Res call({
 NetworkExceptions networkExceptions
});


$NetworkExceptionsCopyWith<$Res> get networkExceptions;

}
/// @nodoc
class _$ErrorAllMoviesCopyWithImpl<T,$Res>
    implements $ErrorAllMoviesCopyWith<T, $Res> {
  _$ErrorAllMoviesCopyWithImpl(this._self, this._then);

  final ErrorAllMovies<T> _self;
  final $Res Function(ErrorAllMovies<T>) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? networkExceptions = null,}) {
  return _then(ErrorAllMovies<T>(
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


class ErrorPaginationAllMovies<T> implements AllMoviesState<T> {
  const ErrorPaginationAllMovies(this.networkExceptions);
  

 final  NetworkExceptions networkExceptions;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPaginationAllMoviesCopyWith<T, ErrorPaginationAllMovies<T>> get copyWith => _$ErrorPaginationAllMoviesCopyWithImpl<T, ErrorPaginationAllMovies<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPaginationAllMovies<T>&&(identical(other.networkExceptions, networkExceptions) || other.networkExceptions == networkExceptions));
}


@override
int get hashCode => Object.hash(runtimeType,networkExceptions);

@override
String toString() {
  return 'AllMoviesState<$T>.errorPaginationAllMovies(networkExceptions: $networkExceptions)';
}


}

/// @nodoc
abstract mixin class $ErrorPaginationAllMoviesCopyWith<T,$Res> implements $AllMoviesStateCopyWith<T, $Res> {
  factory $ErrorPaginationAllMoviesCopyWith(ErrorPaginationAllMovies<T> value, $Res Function(ErrorPaginationAllMovies<T>) _then) = _$ErrorPaginationAllMoviesCopyWithImpl;
@useResult
$Res call({
 NetworkExceptions networkExceptions
});


$NetworkExceptionsCopyWith<$Res> get networkExceptions;

}
/// @nodoc
class _$ErrorPaginationAllMoviesCopyWithImpl<T,$Res>
    implements $ErrorPaginationAllMoviesCopyWith<T, $Res> {
  _$ErrorPaginationAllMoviesCopyWithImpl(this._self, this._then);

  final ErrorPaginationAllMovies<T> _self;
  final $Res Function(ErrorPaginationAllMovies<T>) _then;

/// Create a copy of AllMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? networkExceptions = null,}) {
  return _then(ErrorPaginationAllMovies<T>(
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
