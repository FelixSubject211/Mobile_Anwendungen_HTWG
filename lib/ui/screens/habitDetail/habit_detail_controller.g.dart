// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitDetailDefaultControllerHash() =>
    r'6212ae1a58dab1ea8ec50d9e33fce57e3ae92a4e';

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

abstract class _$HabitDetailDefaultController
    extends BuildlessAutoDisposeNotifier<HabitDetailModel> {
  late final HabitDetailNavigationService habitDetailNavigationService;
  late final HabitRepository habitRepository;
  late final Habit? habit;

  HabitDetailModel build({
    required HabitDetailNavigationService habitDetailNavigationService,
    required HabitRepository habitRepository,
    required Habit? habit,
  });
}

/// See also [HabitDetailDefaultController].
@ProviderFor(HabitDetailDefaultController)
const habitDetailDefaultControllerProvider =
    HabitDetailDefaultControllerFamily();

/// See also [HabitDetailDefaultController].
class HabitDetailDefaultControllerFamily extends Family<HabitDetailModel> {
  /// See also [HabitDetailDefaultController].
  const HabitDetailDefaultControllerFamily();

  /// See also [HabitDetailDefaultController].
  HabitDetailDefaultControllerProvider call({
    required HabitDetailNavigationService habitDetailNavigationService,
    required HabitRepository habitRepository,
    required Habit? habit,
  }) {
    return HabitDetailDefaultControllerProvider(
      habitDetailNavigationService: habitDetailNavigationService,
      habitRepository: habitRepository,
      habit: habit,
    );
  }

  @override
  HabitDetailDefaultControllerProvider getProviderOverride(
    covariant HabitDetailDefaultControllerProvider provider,
  ) {
    return call(
      habitDetailNavigationService: provider.habitDetailNavigationService,
      habitRepository: provider.habitRepository,
      habit: provider.habit,
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
  String? get name => r'habitDetailDefaultControllerProvider';
}

/// See also [HabitDetailDefaultController].
class HabitDetailDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<HabitDetailDefaultController,
        HabitDetailModel> {
  /// See also [HabitDetailDefaultController].
  HabitDetailDefaultControllerProvider({
    required HabitDetailNavigationService habitDetailNavigationService,
    required HabitRepository habitRepository,
    required Habit? habit,
  }) : this._internal(
          () => HabitDetailDefaultController()
            ..habitDetailNavigationService = habitDetailNavigationService
            ..habitRepository = habitRepository
            ..habit = habit,
          from: habitDetailDefaultControllerProvider,
          name: r'habitDetailDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$habitDetailDefaultControllerHash,
          dependencies: HabitDetailDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              HabitDetailDefaultControllerFamily._allTransitiveDependencies,
          habitDetailNavigationService: habitDetailNavigationService,
          habitRepository: habitRepository,
          habit: habit,
        );

  HabitDetailDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitDetailNavigationService,
    required this.habitRepository,
    required this.habit,
  }) : super.internal();

  final HabitDetailNavigationService habitDetailNavigationService;
  final HabitRepository habitRepository;
  final Habit? habit;

  @override
  HabitDetailModel runNotifierBuild(
    covariant HabitDetailDefaultController notifier,
  ) {
    return notifier.build(
      habitDetailNavigationService: habitDetailNavigationService,
      habitRepository: habitRepository,
      habit: habit,
    );
  }

  @override
  Override overrideWith(HabitDetailDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitDetailDefaultControllerProvider._internal(
        () => create()
          ..habitDetailNavigationService = habitDetailNavigationService
          ..habitRepository = habitRepository
          ..habit = habit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitDetailNavigationService: habitDetailNavigationService,
        habitRepository: habitRepository,
        habit: habit,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HabitDetailDefaultController,
      HabitDetailModel> createElement() {
    return _HabitDetailDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitDetailDefaultControllerProvider &&
        other.habitDetailNavigationService == habitDetailNavigationService &&
        other.habitRepository == habitRepository &&
        other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitDetailNavigationService.hashCode);
    hash = _SystemHash.combine(hash, habitRepository.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitDetailDefaultControllerRef
    on AutoDisposeNotifierProviderRef<HabitDetailModel> {
  /// The parameter `habitDetailNavigationService` of this provider.
  HabitDetailNavigationService get habitDetailNavigationService;

  /// The parameter `habitRepository` of this provider.
  HabitRepository get habitRepository;

  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _HabitDetailDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<HabitDetailDefaultController,
        HabitDetailModel> with HabitDetailDefaultControllerRef {
  _HabitDetailDefaultControllerProviderElement(super.provider);

  @override
  HabitDetailNavigationService get habitDetailNavigationService =>
      (origin as HabitDetailDefaultControllerProvider)
          .habitDetailNavigationService;
  @override
  HabitRepository get habitRepository =>
      (origin as HabitDetailDefaultControllerProvider).habitRepository;
  @override
  Habit? get habit => (origin as HabitDetailDefaultControllerProvider).habit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
