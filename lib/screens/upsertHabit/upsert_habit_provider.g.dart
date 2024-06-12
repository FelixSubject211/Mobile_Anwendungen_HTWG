// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_habit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$upsertHabitControllerHash() =>
    r'593322bb3c6128cf6b9952fac2c7e5d2b8320532';

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

/// See also [upsertHabitController].
@ProviderFor(upsertHabitController)
const upsertHabitControllerProvider = UpsertHabitControllerFamily();

/// See also [upsertHabitController].
class UpsertHabitControllerFamily extends Family<UpsertHabitController> {
  /// See also [upsertHabitController].
  const UpsertHabitControllerFamily();

  /// See also [upsertHabitController].
  UpsertHabitControllerProvider call(
    Habit? habit,
  ) {
    return UpsertHabitControllerProvider(
      habit,
    );
  }

  @override
  UpsertHabitControllerProvider getProviderOverride(
    covariant UpsertHabitControllerProvider provider,
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
  String? get name => r'upsertHabitControllerProvider';
}

/// See also [upsertHabitController].
class UpsertHabitControllerProvider
    extends AutoDisposeProvider<UpsertHabitController> {
  /// See also [upsertHabitController].
  UpsertHabitControllerProvider(
    Habit? habit,
  ) : this._internal(
          (ref) => upsertHabitController(
            ref as UpsertHabitControllerRef,
            habit,
          ),
          from: upsertHabitControllerProvider,
          name: r'upsertHabitControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$upsertHabitControllerHash,
          dependencies: UpsertHabitControllerFamily._dependencies,
          allTransitiveDependencies:
              UpsertHabitControllerFamily._allTransitiveDependencies,
          habit: habit,
        );

  UpsertHabitControllerProvider._internal(
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
  Override overrideWith(
    UpsertHabitController Function(UpsertHabitControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpsertHabitControllerProvider._internal(
        (ref) => create(ref as UpsertHabitControllerRef),
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
  AutoDisposeProviderElement<UpsertHabitController> createElement() {
    return _UpsertHabitControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpsertHabitControllerProvider && other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpsertHabitControllerRef
    on AutoDisposeProviderRef<UpsertHabitController> {
  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _UpsertHabitControllerProviderElement
    extends AutoDisposeProviderElement<UpsertHabitController>
    with UpsertHabitControllerRef {
  _UpsertHabitControllerProviderElement(super.provider);

  @override
  Habit? get habit => (origin as UpsertHabitControllerProvider).habit;
}

String _$upsertHabitModelHash() => r'c783762e793bfb1a4965701ba3169afdcd8ca023';

/// See also [upsertHabitModel].
@ProviderFor(upsertHabitModel)
const upsertHabitModelProvider = UpsertHabitModelFamily();

/// See also [upsertHabitModel].
class UpsertHabitModelFamily extends Family<UpsertHabitModel> {
  /// See also [upsertHabitModel].
  const UpsertHabitModelFamily();

  /// See also [upsertHabitModel].
  UpsertHabitModelProvider call(
    Habit? habit,
  ) {
    return UpsertHabitModelProvider(
      habit,
    );
  }

  @override
  UpsertHabitModelProvider getProviderOverride(
    covariant UpsertHabitModelProvider provider,
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
  String? get name => r'upsertHabitModelProvider';
}

/// See also [upsertHabitModel].
class UpsertHabitModelProvider extends AutoDisposeProvider<UpsertHabitModel> {
  /// See also [upsertHabitModel].
  UpsertHabitModelProvider(
    Habit? habit,
  ) : this._internal(
          (ref) => upsertHabitModel(
            ref as UpsertHabitModelRef,
            habit,
          ),
          from: upsertHabitModelProvider,
          name: r'upsertHabitModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$upsertHabitModelHash,
          dependencies: UpsertHabitModelFamily._dependencies,
          allTransitiveDependencies:
              UpsertHabitModelFamily._allTransitiveDependencies,
          habit: habit,
        );

  UpsertHabitModelProvider._internal(
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
  Override overrideWith(
    UpsertHabitModel Function(UpsertHabitModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpsertHabitModelProvider._internal(
        (ref) => create(ref as UpsertHabitModelRef),
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
  AutoDisposeProviderElement<UpsertHabitModel> createElement() {
    return _UpsertHabitModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpsertHabitModelProvider && other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpsertHabitModelRef on AutoDisposeProviderRef<UpsertHabitModel> {
  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _UpsertHabitModelProviderElement
    extends AutoDisposeProviderElement<UpsertHabitModel>
    with UpsertHabitModelRef {
  _UpsertHabitModelProviderElement(super.provider);

  @override
  Habit? get habit => (origin as UpsertHabitModelProvider).habit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
