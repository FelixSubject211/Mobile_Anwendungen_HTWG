// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitDetailModel {
  bool get isInEditMode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HabitDetailModelCopyWith<HabitDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitDetailModelCopyWith<$Res> {
  factory $HabitDetailModelCopyWith(
          HabitDetailModel value, $Res Function(HabitDetailModel) then) =
      _$HabitDetailModelCopyWithImpl<$Res, HabitDetailModel>;
  @useResult
  $Res call({bool isInEditMode, String name});
}

/// @nodoc
class _$HabitDetailModelCopyWithImpl<$Res, $Val extends HabitDetailModel>
    implements $HabitDetailModelCopyWith<$Res> {
  _$HabitDetailModelCopyWithImpl(this._value, this._then);

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
abstract class _$$HabitDetailModelImplCopyWith<$Res>
    implements $HabitDetailModelCopyWith<$Res> {
  factory _$$HabitDetailModelImplCopyWith(_$HabitDetailModelImpl value,
          $Res Function(_$HabitDetailModelImpl) then) =
      __$$HabitDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInEditMode, String name});
}

/// @nodoc
class __$$HabitDetailModelImplCopyWithImpl<$Res>
    extends _$HabitDetailModelCopyWithImpl<$Res, _$HabitDetailModelImpl>
    implements _$$HabitDetailModelImplCopyWith<$Res> {
  __$$HabitDetailModelImplCopyWithImpl(_$HabitDetailModelImpl _value,
      $Res Function(_$HabitDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInEditMode = null,
    Object? name = null,
  }) {
    return _then(_$HabitDetailModelImpl(
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

class _$HabitDetailModelImpl implements _HabitDetailModel {
  _$HabitDetailModelImpl({required this.isInEditMode, required this.name});

  @override
  final bool isInEditMode;
  @override
  final String name;

  @override
  String toString() {
    return 'HabitDetailModel(isInEditMode: $isInEditMode, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitDetailModelImpl &&
            (identical(other.isInEditMode, isInEditMode) ||
                other.isInEditMode == isInEditMode) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInEditMode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitDetailModelImplCopyWith<_$HabitDetailModelImpl> get copyWith =>
      __$$HabitDetailModelImplCopyWithImpl<_$HabitDetailModelImpl>(
          this, _$identity);
}

abstract class _HabitDetailModel implements HabitDetailModel {
  factory _HabitDetailModel(
      {required final bool isInEditMode,
      required final String name}) = _$HabitDetailModelImpl;

  @override
  bool get isInEditMode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$HabitDetailModelImplCopyWith<_$HabitDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
