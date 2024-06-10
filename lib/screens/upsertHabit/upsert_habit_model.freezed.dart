// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpsertHabitModel {
  bool get isInEditMode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpsertHabitModelCopyWith<UpsertHabitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpsertHabitModelCopyWith<$Res> {
  factory $UpsertHabitModelCopyWith(
          UpsertHabitModel value, $Res Function(UpsertHabitModel) then) =
      _$UpsertHabitModelCopyWithImpl<$Res, UpsertHabitModel>;
  @useResult
  $Res call({bool isInEditMode, String name});
}

/// @nodoc
class _$UpsertHabitModelCopyWithImpl<$Res, $Val extends UpsertHabitModel>
    implements $UpsertHabitModelCopyWith<$Res> {
  _$UpsertHabitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInEditMode = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      isInEditMode: null == isInEditMode
          ? _value.isInEditMode
          : isInEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpsertHabitModelImplCopyWith<$Res>
    implements $UpsertHabitModelCopyWith<$Res> {
  factory _$$UpsertHabitModelImplCopyWith(_$UpsertHabitModelImpl value,
          $Res Function(_$UpsertHabitModelImpl) then) =
      __$$UpsertHabitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInEditMode, String name});
}

/// @nodoc
class __$$UpsertHabitModelImplCopyWithImpl<$Res>
    extends _$UpsertHabitModelCopyWithImpl<$Res, _$UpsertHabitModelImpl>
    implements _$$UpsertHabitModelImplCopyWith<$Res> {
  __$$UpsertHabitModelImplCopyWithImpl(_$UpsertHabitModelImpl _value,
      $Res Function(_$UpsertHabitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInEditMode = null,
    Object? name = null,
  }) {
    return _then(_$UpsertHabitModelImpl(
      isInEditMode: null == isInEditMode
          ? _value.isInEditMode
          : isInEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpsertHabitModelImpl implements _UpsertHabitModel {
  _$UpsertHabitModelImpl({required this.isInEditMode, required this.name});

  @override
  final bool isInEditMode;
  @override
  final String name;

  @override
  String toString() {
    return 'UpsertHabitModel(isInEditMode: $isInEditMode, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertHabitModelImpl &&
            (identical(other.isInEditMode, isInEditMode) ||
                other.isInEditMode == isInEditMode) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInEditMode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpsertHabitModelImplCopyWith<_$UpsertHabitModelImpl> get copyWith =>
      __$$UpsertHabitModelImplCopyWithImpl<_$UpsertHabitModelImpl>(
          this, _$identity);
}

abstract class _UpsertHabitModel implements UpsertHabitModel {
  factory _UpsertHabitModel(
      {required final bool isInEditMode,
      required final String name}) = _$UpsertHabitModelImpl;

  @override
  bool get isInEditMode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UpsertHabitModelImplCopyWith<_$UpsertHabitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
