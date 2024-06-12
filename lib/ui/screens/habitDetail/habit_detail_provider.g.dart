// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitDetailControllerHash() =>
    r'3b8c7c9e81d76367f598e888e420313f011b4931';

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

/// See also [habitDetailController].
@ProviderFor(habitDetailController)
const habitDetailControllerProvider = HabitDetailControllerFamily();

/// See also [habitDetailController].
class HabitDetailControllerFamily extends Family<HabitDetailController> {
  /// See also [habitDetailController].
  const HabitDetailControllerFamily();

  /// See also [habitDetailController].
  HabitDetailControllerProvider call(
    Habit? habit,
  ) {
    return HabitDetailControllerProvider(
      habit,
    );
  }

  @override
  HabitDetailControllerProvider getProviderOverride(
    covariant HabitDetailControllerProvider provider,
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
  String? get name => r'habitDetailControllerProvider';
}

/// See also [habitDetailController].
class HabitDetailControllerProvider
    extends AutoDisposeProvider<HabitDetailController> {
  /// See also [habitDetailController].
  HabitDetailControllerProvider(
    Habit? habit,
  ) : this._internal(
          (ref) => habitDetailController(
            ref as HabitDetailControllerRef,
            habit,
          ),
          from: habitDetailControllerProvider,
          name: r'habitDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$habitDetailControllerHash,
          dependencies: HabitDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              HabitDetailControllerFamily._allTransitiveDependencies,
          habit: habit,
        );

  HabitDetailControllerProvider._internal(
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
    HabitDetailController Function(HabitDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HabitDetailControllerProvider._internal(
        (ref) => create(ref as HabitDetailControllerRef),
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
  AutoDisposeProviderElement<HabitDetailController> createElement() {
    return _HabitDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitDetailControllerProvider && other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitDetailControllerRef
    on AutoDisposeProviderRef<HabitDetailController> {
  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _HabitDetailControllerProviderElement
    extends AutoDisposeProviderElement<HabitDetailController>
    with HabitDetailControllerRef {
  _HabitDetailControllerProviderElement(super.provider);

  @override
  Habit? get habit => (origin as HabitDetailControllerProvider).habit;
}

String _$habitDetailModelHash() => r'9d6487bfe6638a9156dbc64032d6354175a1430a';

/// See also [habitDetailModel].
@ProviderFor(habitDetailModel)
const habitDetailModelProvider = HabitDetailModelFamily();

/// See also [habitDetailModel].
class HabitDetailModelFamily extends Family<HabitDetailModel> {
  /// See also [habitDetailModel].
  const HabitDetailModelFamily();

  /// See also [habitDetailModel].
  HabitDetailModelProvider call(
    Habit? habit,
  ) {
    return HabitDetailModelProvider(
      habit,
    );
  }

  @override
  HabitDetailModelProvider getProviderOverride(
    covariant HabitDetailModelProvider provider,
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
  String? get name => r'habitDetailModelProvider';
}

/// See also [habitDetailModel].
class HabitDetailModelProvider extends AutoDisposeProvider<HabitDetailModel> {
  /// See also [habitDetailModel].
  HabitDetailModelProvider(
    Habit? habit,
  ) : this._internal(
          (ref) => habitDetailModel(
            ref as HabitDetailModelRef,
            habit,
          ),
          from: habitDetailModelProvider,
          name: r'habitDetailModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$habitDetailModelHash,
          dependencies: HabitDetailModelFamily._dependencies,
          allTransitiveDependencies:
              HabitDetailModelFamily._allTransitiveDependencies,
          habit: habit,
        );

  HabitDetailModelProvider._internal(
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
    HabitDetailModel Function(HabitDetailModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HabitDetailModelProvider._internal(
        (ref) => create(ref as HabitDetailModelRef),
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
  AutoDisposeProviderElement<HabitDetailModel> createElement() {
    return _HabitDetailModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitDetailModelProvider && other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitDetailModelRef on AutoDisposeProviderRef<HabitDetailModel> {
  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _HabitDetailModelProviderElement
    extends AutoDisposeProviderElement<HabitDetailModel>
    with HabitDetailModelRef {
  _HabitDetailModelProviderElement(super.provider);

  @override
  Habit? get habit => (origin as HabitDetailModelProvider).habit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
