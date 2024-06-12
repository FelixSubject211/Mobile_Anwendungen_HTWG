// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitsDefaultControllerHash() =>
    r'9737ed0c71834367036191e51571ed110a3b80d9';

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

abstract class _$HabitsDefaultController
    extends BuildlessAutoDisposeNotifier<HabitsModel> {
  late final HabitsNavigationService habitsNavigationService;
  late final HabitRepository habitRepository;

  HabitsModel build({
    required HabitsNavigationService habitsNavigationService,
    required HabitRepository habitRepository,
  });
}

/// See also [HabitsDefaultController].
@ProviderFor(HabitsDefaultController)
const habitsDefaultControllerProvider = HabitsDefaultControllerFamily();

/// See also [HabitsDefaultController].
class HabitsDefaultControllerFamily extends Family<HabitsModel> {
  /// See also [HabitsDefaultController].
  const HabitsDefaultControllerFamily();

  /// See also [HabitsDefaultController].
  HabitsDefaultControllerProvider call({
    required HabitsNavigationService habitsNavigationService,
    required HabitRepository habitRepository,
  }) {
    return HabitsDefaultControllerProvider(
      habitsNavigationService: habitsNavigationService,
      habitRepository: habitRepository,
    );
  }

  @override
  HabitsDefaultControllerProvider getProviderOverride(
    covariant HabitsDefaultControllerProvider provider,
  ) {
    return call(
      habitsNavigationService: provider.habitsNavigationService,
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
  String? get name => r'habitsDefaultControllerProvider';
}

/// See also [HabitsDefaultController].
class HabitsDefaultControllerProvider extends AutoDisposeNotifierProviderImpl<
    HabitsDefaultController, HabitsModel> {
  /// See also [HabitsDefaultController].
  HabitsDefaultControllerProvider({
    required HabitsNavigationService habitsNavigationService,
    required HabitRepository habitRepository,
  }) : this._internal(
          () => HabitsDefaultController()
            ..habitsNavigationService = habitsNavigationService
            ..habitRepository = habitRepository,
          from: habitsDefaultControllerProvider,
          name: r'habitsDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$habitsDefaultControllerHash,
          dependencies: HabitsDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              HabitsDefaultControllerFamily._allTransitiveDependencies,
          habitsNavigationService: habitsNavigationService,
          habitRepository: habitRepository,
        );

  HabitsDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitsNavigationService,
    required this.habitRepository,
  }) : super.internal();

  final HabitsNavigationService habitsNavigationService;
  final HabitRepository habitRepository;

  @override
  HabitsModel runNotifierBuild(
    covariant HabitsDefaultController notifier,
  ) {
    return notifier.build(
      habitsNavigationService: habitsNavigationService,
      habitRepository: habitRepository,
    );
  }

  @override
  Override overrideWith(HabitsDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitsDefaultControllerProvider._internal(
        () => create()
          ..habitsNavigationService = habitsNavigationService
          ..habitRepository = habitRepository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitsNavigationService: habitsNavigationService,
        habitRepository: habitRepository,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HabitsDefaultController, HabitsModel>
      createElement() {
    return _HabitsDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitsDefaultControllerProvider &&
        other.habitsNavigationService == habitsNavigationService &&
        other.habitRepository == habitRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitsNavigationService.hashCode);
    hash = _SystemHash.combine(hash, habitRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitsDefaultControllerRef
    on AutoDisposeNotifierProviderRef<HabitsModel> {
  /// The parameter `habitsNavigationService` of this provider.
  HabitsNavigationService get habitsNavigationService;

  /// The parameter `habitRepository` of this provider.
  HabitRepository get habitRepository;
}

class _HabitsDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<HabitsDefaultController,
        HabitsModel> with HabitsDefaultControllerRef {
  _HabitsDefaultControllerProviderElement(super.provider);

  @override
  HabitsNavigationService get habitsNavigationService =>
      (origin as HabitsDefaultControllerProvider).habitsNavigationService;
  @override
  HabitRepository get habitRepository =>
      (origin as HabitsDefaultControllerProvider).habitRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
