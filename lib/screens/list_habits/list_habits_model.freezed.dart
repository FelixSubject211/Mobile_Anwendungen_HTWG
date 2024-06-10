// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_habits_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListHabitsModel {
  Stream<List<Habit>> get habits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListHabitsModelCopyWith<ListHabitsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListHabitsModelCopyWith<$Res> {
  factory $ListHabitsModelCopyWith(
          ListHabitsModel value, $Res Function(ListHabitsModel) then) =
      _$ListHabitsModelCopyWithImpl<$Res, ListHabitsModel>;
  @useResult
  $Res call({Stream<List<Habit>> habits});
}

/// @nodoc
class _$ListHabitsModelCopyWithImpl<$Res, $Val extends ListHabitsModel>
    implements $ListHabitsModelCopyWith<$Res> {
  _$ListHabitsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habits = null,
  }) {
    return _then(_value.copyWith(
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as Stream<List<Habit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListHabitsModelImplCopyWith<$Res>
    implements $ListHabitsModelCopyWith<$Res> {
  factory _$$ListHabitsModelImplCopyWith(_$ListHabitsModelImpl value,
          $Res Function(_$ListHabitsModelImpl) then) =
      __$$ListHabitsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Stream<List<Habit>> habits});
}

/// @nodoc
class __$$ListHabitsModelImplCopyWithImpl<$Res>
    extends _$ListHabitsModelCopyWithImpl<$Res, _$ListHabitsModelImpl>
    implements _$$ListHabitsModelImplCopyWith<$Res> {
  __$$ListHabitsModelImplCopyWithImpl(
      _$ListHabitsModelImpl _value, $Res Function(_$ListHabitsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habits = null,
  }) {
    return _then(_$ListHabitsModelImpl(
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as Stream<List<Habit>>,
    ));
  }
}

/// @nodoc

class _$ListHabitsModelImpl implements _ListHabitsModel {
  _$ListHabitsModelImpl({required this.habits});

  @override
  final Stream<List<Habit>> habits;

  @override
  String toString() {
    return 'ListHabitsModel(habits: $habits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListHabitsModelImpl &&
            (identical(other.habits, habits) || other.habits == habits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListHabitsModelImplCopyWith<_$ListHabitsModelImpl> get copyWith =>
      __$$ListHabitsModelImplCopyWithImpl<_$ListHabitsModelImpl>(
          this, _$identity);
}

abstract class _ListHabitsModel implements ListHabitsModel {
  factory _ListHabitsModel({required final Stream<List<Habit>> habits}) =
      _$ListHabitsModelImpl;

  @override
  Stream<List<Habit>> get habits;
  @override
  @JsonKey(ignore: true)
  _$$ListHabitsModelImplCopyWith<_$ListHabitsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
