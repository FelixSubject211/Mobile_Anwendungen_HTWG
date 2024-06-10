// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_habit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$upsertHabitDefaultControllerHash() =>
    r'9e818f3d3c37b0eee5e548be9941546313c6fa79';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UpsertHabitDefaultController
    extends BuildlessAutoDisposeNotifier<UpsertHabitModel> {
  late final Habit? habit;

  UpsertHabitModel build(
    Habit? habit,
  );
}

/// See also [UpsertHabitDefaultController].
@ProviderFor(UpsertHabitDefaultController)
const upsertHabitDefaultControllerProvider =
    UpsertHabitDefaultControllerFamily();

/// See also [UpsertHabitDefaultController].
class UpsertHabitDefaultControllerFamily extends Family<UpsertHabitModel> {
  /// See also [UpsertHabitDefaultController].
  const UpsertHabitDefaultControllerFamily();

  /// See also [UpsertHabitDefaultController].
  UpsertHabitDefaultControllerProvider call(
    Habit? habit,
  ) {
    return UpsertHabitDefaultControllerProvider(
      habit,
    );
  }

  @override
  UpsertHabitDefaultControllerProvider getProviderOverride(
    covariant UpsertHabitDefaultControllerProvider provider,
  ) {
    return call(
      provider.habit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'upsertHabitDefaultControllerProvider';
}

/// See also [UpsertHabitDefaultController].
class UpsertHabitDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<UpsertHabitDefaultController,
        UpsertHabitModel> {
  /// See also [UpsertHabitDefaultController].
  UpsertHabitDefaultControllerProvider(
    Habit? habit,
  ) : this._internal(
          () => UpsertHabitDefaultController()..habit = habit,
          from: upsertHabitDefaultControllerProvider,
          name: r'upsertHabitDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$upsertHabitDefaultControllerHash,
          dependencies: UpsertHabitDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              UpsertHabitDefaultControllerFamily._allTransitiveDependencies,
          habit: habit,
        );

  UpsertHabitDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habit,
  }) : super.internal();

  final Habit? habit;

  @override
  UpsertHabitModel runNotifierBuild(
    covariant UpsertHabitDefaultController notifier,
  ) {
    return notifier.build(
      habit,
    );
  }

  @override
  Override overrideWith(UpsertHabitDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: UpsertHabitDefaultControllerProvider._internal(
        () => create()..habit = habit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habit: habit,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UpsertHabitDefaultController,
      UpsertHabitModel> createElement() {
    return _UpsertHabitDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpsertHabitDefaultControllerProvider &&
        other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpsertHabitDefaultControllerRef
    on AutoDisposeNotifierProviderRef<UpsertHabitModel> {
  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _UpsertHabitDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<UpsertHabitDefaultController,
        UpsertHabitModel> with UpsertHabitDefaultControllerRef {
  _UpsertHabitDefaultControllerProviderElement(super.provider);

  @override
  Habit? get habit => (origin as UpsertHabitDefaultControllerProvider).habit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
