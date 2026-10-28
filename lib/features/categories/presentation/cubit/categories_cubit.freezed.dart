// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( List<CategoryEntity> categories)?  success,TResult Function( NetworkExceptions error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.categories);case _Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( List<CategoryEntity> categories)  success,required TResult Function( NetworkExceptions error)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Loading():
return loading();case _Success():
return success(_that.categories);case _Error():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( List<CategoryEntity> categories)?  success,TResult? Function( NetworkExceptions error)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.categories);case _Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements CategoriesState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.idle()';
}


}




/// @nodoc


class _Loading implements CategoriesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.loading()';
}


}




/// @nodoc


class _Success implements CategoriesState {
  const _Success(final  List<CategoryEntity> categories): _categories = categories;
  

 final  List<CategoryEntity> _categories;
 List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoriesState.success(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryEntity> categories
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_Success(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}


}

/// @nodoc


class _Error implements CategoriesState {
  const _Error(this.error);
  

 final  NetworkExceptions error;

/// Create a copy of CategoriesState
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
  return 'CategoriesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
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

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as NetworkExceptions,
  ));
}

/// Create a copy of CategoriesState
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
