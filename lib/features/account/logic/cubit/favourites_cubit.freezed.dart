// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavouritesState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavouritesState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>()';
}


}

/// @nodoc
class $FavouritesStateCopyWith<T,$Res>  {
$FavouritesStateCopyWith(FavouritesState<T> _, $Res Function(FavouritesState<T>) __);
}


/// Adds pattern-matching-related methods to [FavouritesState].
extension FavouritesStatePatterns<T> on FavouritesState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle<T> value)?  idle,TResult Function( Loading<T> value)?  loading,TResult Function( IsFavourite<T> value)?  isFavourite,TResult Function( IsNotFavourite<T> value)?  isNotFavourite,TResult Function( AddedToFavourites<T> value)?  addedToFavourites,TResult Function( RemovedFromFavourites<T> value)?  removedFromFavourites,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Loading() when loading != null:
return loading(_that);case IsFavourite() when isFavourite != null:
return isFavourite(_that);case IsNotFavourite() when isNotFavourite != null:
return isNotFavourite(_that);case AddedToFavourites() when addedToFavourites != null:
return addedToFavourites(_that);case RemovedFromFavourites() when removedFromFavourites != null:
return removedFromFavourites(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle<T> value)  idle,required TResult Function( Loading<T> value)  loading,required TResult Function( IsFavourite<T> value)  isFavourite,required TResult Function( IsNotFavourite<T> value)  isNotFavourite,required TResult Function( AddedToFavourites<T> value)  addedToFavourites,required TResult Function( RemovedFromFavourites<T> value)  removedFromFavourites,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case Loading():
return loading(_that);case IsFavourite():
return isFavourite(_that);case IsNotFavourite():
return isNotFavourite(_that);case AddedToFavourites():
return addedToFavourites(_that);case RemovedFromFavourites():
return removedFromFavourites(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle<T> value)?  idle,TResult? Function( Loading<T> value)?  loading,TResult? Function( IsFavourite<T> value)?  isFavourite,TResult? Function( IsNotFavourite<T> value)?  isNotFavourite,TResult? Function( AddedToFavourites<T> value)?  addedToFavourites,TResult? Function( RemovedFromFavourites<T> value)?  removedFromFavourites,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Loading() when loading != null:
return loading(_that);case IsFavourite() when isFavourite != null:
return isFavourite(_that);case IsNotFavourite() when isNotFavourite != null:
return isNotFavourite(_that);case AddedToFavourites() when addedToFavourites != null:
return addedToFavourites(_that);case RemovedFromFavourites() when removedFromFavourites != null:
return removedFromFavourites(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function()?  isFavourite,TResult Function()?  isNotFavourite,TResult Function()?  addedToFavourites,TResult Function()?  removedFromFavourites,TResult Function( NetworkExceptions networkException)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Loading() when loading != null:
return loading();case IsFavourite() when isFavourite != null:
return isFavourite();case IsNotFavourite() when isNotFavourite != null:
return isNotFavourite();case AddedToFavourites() when addedToFavourites != null:
return addedToFavourites();case RemovedFromFavourites() when removedFromFavourites != null:
return removedFromFavourites();case Error() when error != null:
return error(_that.networkException);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function()  isFavourite,required TResult Function()  isNotFavourite,required TResult Function()  addedToFavourites,required TResult Function()  removedFromFavourites,required TResult Function( NetworkExceptions networkException)  error,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case Loading():
return loading();case IsFavourite():
return isFavourite();case IsNotFavourite():
return isNotFavourite();case AddedToFavourites():
return addedToFavourites();case RemovedFromFavourites():
return removedFromFavourites();case Error():
return error(_that.networkException);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function()?  isFavourite,TResult? Function()?  isNotFavourite,TResult? Function()?  addedToFavourites,TResult? Function()?  removedFromFavourites,TResult? Function( NetworkExceptions networkException)?  error,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Loading() when loading != null:
return loading();case IsFavourite() when isFavourite != null:
return isFavourite();case IsNotFavourite() when isNotFavourite != null:
return isNotFavourite();case AddedToFavourites() when addedToFavourites != null:
return addedToFavourites();case RemovedFromFavourites() when removedFromFavourites != null:
return removedFromFavourites();case Error() when error != null:
return error(_that.networkException);case _:
  return null;

}
}

}

/// @nodoc


class Idle<T> implements FavouritesState<T> {
  const Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>.idle()';
}


}




/// @nodoc


class Loading<T> implements FavouritesState<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>.loading()';
}


}




/// @nodoc


class IsFavourite<T> implements FavouritesState<T> {
  const IsFavourite();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsFavourite<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>.isFavourite()';
}


}




/// @nodoc


class IsNotFavourite<T> implements FavouritesState<T> {
  const IsNotFavourite();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsNotFavourite<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>.isNotFavourite()';
}


}




/// @nodoc


class AddedToFavourites<T> implements FavouritesState<T> {
  const AddedToFavourites();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddedToFavourites<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>.addedToFavourites()';
}


}




/// @nodoc


class RemovedFromFavourites<T> implements FavouritesState<T> {
  const RemovedFromFavourites();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovedFromFavourites<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesState<$T>.removedFromFavourites()';
}


}




/// @nodoc


class Error<T> implements FavouritesState<T> {
  const Error(this.networkException);
  

 final  NetworkExceptions networkException;

/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.networkException, networkException) || other.networkException == networkException));
}


@override
int get hashCode => Object.hash(runtimeType,networkException);

@override
String toString() {
  return 'FavouritesState<$T>.error(networkException: $networkException)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $FavouritesStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 NetworkExceptions networkException
});


$NetworkExceptionsCopyWith<$Res> get networkException;

}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? networkException = null,}) {
  return _then(Error<T>(
null == networkException ? _self.networkException : networkException // ignore: cast_nullable_to_non_nullable
as NetworkExceptions,
  ));
}

/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkExceptionsCopyWith<$Res> get networkException {
  
  return $NetworkExceptionsCopyWith<$Res>(_self.networkException, (value) {
    return _then(_self.copyWith(networkException: value));
  });
}
}

// dart format on
