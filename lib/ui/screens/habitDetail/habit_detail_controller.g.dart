// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitDetailDefaultControllerHash() =>
    r'4f79ac913ec386014516049fb374e9d7798f1a38';

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
  late final int? id;

  HabitDetailModel build({
    required HabitDetailNavigationService habitDetailNavigationService,
    required HabitRepository habitRepository,
    required int? id,
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
    required int? id,
  }) {
    return HabitDetailDefaultControllerProvider(
      habitDetailNavigationService: habitDetailNavigationService,
      habitRepository: habitRepository,
      id: id,
    );
  }

  @override
  HabitDetailDefaultControllerProvider getProviderOverride(
    covariant HabitDetailDefaultControllerProvider provider,
  ) {
    return call(
      habitDetailNavigationService: provider.habitDetailNavigationService,
      habitRepository: provider.habitRepository,
      id: provider.id,
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
    required int? id,
  }) : this._internal(
          () => HabitDetailDefaultController()
            ..habitDetailNavigationService = habitDetailNavigationService
            ..habitRepository = habitRepository
            ..id = id,
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
          id: id,
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
    required this.id,
  }) : super.internal();

  final HabitDetailNavigationService habitDetailNavigationService;
  final HabitRepository habitRepository;
  final int? id;

  @override
  HabitDetailModel runNotifierBuild(
    covariant HabitDetailDefaultController notifier,
  ) {
    return notifier.build(
      habitDetailNavigationService: habitDetailNavigationService,
      habitRepository: habitRepository,
      id: id,
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
          ..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitDetailNavigationService: habitDetailNavigationService,
        habitRepository: habitRepository,
        id: id,
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
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitDetailNavigationService.hashCode);
    hash = _SystemHash.combine(hash, habitRepository.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitDetailDefaultControllerRef
    on AutoDisposeNotifierProviderRef<HabitDetailModel> {
  /// The parameter `habitDetailNavigationService` of this provider.
  HabitDetailNavigationService get habitDetailNavigationService;

  /// The parameter `habitRepository` of this provider.
  HabitRepository get habitRepository;

  /// The parameter `id` of this provider.
  int? get id;
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
  int? get id => (origin as HabitDetailDefaultControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
