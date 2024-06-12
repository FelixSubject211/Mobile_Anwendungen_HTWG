// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statisticsDefaultControllerHash() =>
    r'569a5fd4f479cd9d1503ca57ffd3fb62d97cbb6b';

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

abstract class _$StatisticsDefaultController
    extends BuildlessAutoDisposeNotifier<StatisticsModel> {
  late final HabitRepository habitRepository;

  StatisticsModel build({
    required HabitRepository habitRepository,
  });
}

/// See also [StatisticsDefaultController].
@ProviderFor(StatisticsDefaultController)
const statisticsDefaultControllerProvider = StatisticsDefaultControllerFamily();

/// See also [StatisticsDefaultController].
class StatisticsDefaultControllerFamily extends Family<StatisticsModel> {
  /// See also [StatisticsDefaultController].
  const StatisticsDefaultControllerFamily();

  /// See also [StatisticsDefaultController].
  StatisticsDefaultControllerProvider call({
    required HabitRepository habitRepository,
  }) {
    return StatisticsDefaultControllerProvider(
      habitRepository: habitRepository,
    );
  }

  @override
  StatisticsDefaultControllerProvider getProviderOverride(
    covariant StatisticsDefaultControllerProvider provider,
  ) {
    return call(
      habitRepository: provider.habitRepository,
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
  String? get name => r'statisticsDefaultControllerProvider';
}

/// See also [StatisticsDefaultController].
class StatisticsDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<StatisticsDefaultController,
        StatisticsModel> {
  /// See also [StatisticsDefaultController].
  StatisticsDefaultControllerProvider({
    required HabitRepository habitRepository,
  }) : this._internal(
          () =>
              StatisticsDefaultController()..habitRepository = habitRepository,
          from: statisticsDefaultControllerProvider,
          name: r'statisticsDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statisticsDefaultControllerHash,
          dependencies: StatisticsDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              StatisticsDefaultControllerFamily._allTransitiveDependencies,
          habitRepository: habitRepository,
        );

  StatisticsDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitRepository,
  }) : super.internal();

  final HabitRepository habitRepository;

  @override
  StatisticsModel runNotifierBuild(
    covariant StatisticsDefaultController notifier,
  ) {
    return notifier.build(
      habitRepository: habitRepository,
    );
  }

  @override
  Override overrideWith(StatisticsDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StatisticsDefaultControllerProvider._internal(
        () => create()..habitRepository = habitRepository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitRepository: habitRepository,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<StatisticsDefaultController,
      StatisticsModel> createElement() {
    return _StatisticsDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatisticsDefaultControllerProvider &&
        other.habitRepository == habitRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StatisticsDefaultControllerRef
    on AutoDisposeNotifierProviderRef<StatisticsModel> {
  /// The parameter `habitRepository` of this provider.
  HabitRepository get habitRepository;
}

class _StatisticsDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<StatisticsDefaultController,
        StatisticsModel> with StatisticsDefaultControllerRef {
  _StatisticsDefaultControllerProviderElement(super.provider);

  @override
  HabitRepository get habitRepository =>
      (origin as StatisticsDefaultControllerProvider).habitRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
