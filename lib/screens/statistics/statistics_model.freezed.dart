// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatisticsModel {
  String get selectedButton => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res, StatisticsModel>;
  @useResult
  $Res call({String selectedButton});
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res, $Val extends StatisticsModel>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedButton = null,
  }) {
    return _then(_value.copyWith(
      selectedButton: null == selectedButton
          ? _value.selectedButton
          : selectedButton // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsModelImplCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$$StatisticsModelImplCopyWith(_$StatisticsModelImpl value,
          $Res Function(_$StatisticsModelImpl) then) =
      __$$StatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectedButton});
}

/// @nodoc
class __$$StatisticsModelImplCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res, _$StatisticsModelImpl>
    implements _$$StatisticsModelImplCopyWith<$Res> {
  __$$StatisticsModelImplCopyWithImpl(
      _$StatisticsModelImpl _value, $Res Function(_$StatisticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedButton = null,
  }) {
    return _then(_$StatisticsModelImpl(
      selectedButton: null == selectedButton
          ? _value.selectedButton
          : selectedButton // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatisticsModelImpl implements _StatisticsModel {
  _$StatisticsModelImpl({required this.selectedButton});

  @override
  final String selectedButton;

  @override
  String toString() {
    return 'StatisticsModel(selectedButton: $selectedButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsModelImpl &&
            (identical(other.selectedButton, selectedButton) ||
                other.selectedButton == selectedButton));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedButton);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      __$$StatisticsModelImplCopyWithImpl<_$StatisticsModelImpl>(
          this, _$identity);
}

abstract class _StatisticsModel implements StatisticsModel {
  factory _StatisticsModel({required final String selectedButton}) =
      _$StatisticsModelImpl;

  @override
  String get selectedButton;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
