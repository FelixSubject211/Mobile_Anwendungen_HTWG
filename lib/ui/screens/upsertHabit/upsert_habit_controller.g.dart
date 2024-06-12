// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_habit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$upsertHabitDefaultControllerHash() =>
    r'e794a826139b95113a694968dc2b9a21226dd25c';

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
  late final UpsertHabitNavigationService upsertHabitNavigationService;
  late final HabitRepository habitRepository;
  late final Habit? habit;

  UpsertHabitModel build({
    required UpsertHabitNavigationService upsertHabitNavigationService,
    required HabitRepository habitRepository,
    required Habit? habit,
  });
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
  UpsertHabitDefaultControllerProvider call({
    required UpsertHabitNavigationService upsertHabitNavigationService,
    required HabitRepository habitRepository,
    required Habit? habit,
  }) {
    return UpsertHabitDefaultControllerProvider(
      upsertHabitNavigationService: upsertHabitNavigationService,
      habitRepository: habitRepository,
      habit: habit,
    );
  }

  @override
  UpsertHabitDefaultControllerProvider getProviderOverride(
    covariant UpsertHabitDefaultControllerProvider provider,
  ) {
    return call(
      upsertHabitNavigationService: provider.upsertHabitNavigationService,
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
  String? get name => r'upsertHabitDefaultControllerProvider';
}

/// See also [UpsertHabitDefaultController].
class UpsertHabitDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<UpsertHabitDefaultController,
        UpsertHabitModel> {
  /// See also [UpsertHabitDefaultController].
  UpsertHabitDefaultControllerProvider({
    required UpsertHabitNavigationService upsertHabitNavigationService,
    required HabitRepository habitRepository,
    required Habit? habit,
  }) : this._internal(
          () => UpsertHabitDefaultController()
            ..upsertHabitNavigationService = upsertHabitNavigationService
            ..habitRepository = habitRepository
            ..habit = habit,
          from: upsertHabitDefaultControllerProvider,
          name: r'upsertHabitDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$upsertHabitDefaultControllerHash,
          dependencies: UpsertHabitDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              UpsertHabitDefaultControllerFamily._allTransitiveDependencies,
          upsertHabitNavigationService: upsertHabitNavigationService,
          habitRepository: habitRepository,
          habit: habit,
        );

  UpsertHabitDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.upsertHabitNavigationService,
    required this.habitRepository,
    required this.habit,
  }) : super.internal();

  final UpsertHabitNavigationService upsertHabitNavigationService;
  final HabitRepository habitRepository;
  final Habit? habit;

  @override
  UpsertHabitModel runNotifierBuild(
    covariant UpsertHabitDefaultController notifier,
  ) {
    return notifier.build(
      upsertHabitNavigationService: upsertHabitNavigationService,
      habitRepository: habitRepository,
      habit: habit,
    );
  }

  @override
  Override overrideWith(UpsertHabitDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: UpsertHabitDefaultControllerProvider._internal(
        () => create()
          ..upsertHabitNavigationService = upsertHabitNavigationService
          ..habitRepository = habitRepository
          ..habit = habit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        upsertHabitNavigationService: upsertHabitNavigationService,
        habitRepository: habitRepository,
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
        other.upsertHabitNavigationService == upsertHabitNavigationService &&
        other.habitRepository == habitRepository &&
        other.habit == habit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, upsertHabitNavigationService.hashCode);
    hash = _SystemHash.combine(hash, habitRepository.hashCode);
    hash = _SystemHash.combine(hash, habit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpsertHabitDefaultControllerRef
    on AutoDisposeNotifierProviderRef<UpsertHabitModel> {
  /// The parameter `upsertHabitNavigationService` of this provider.
  UpsertHabitNavigationService get upsertHabitNavigationService;

  /// The parameter `habitRepository` of this provider.
  HabitRepository get habitRepository;

  /// The parameter `habit` of this provider.
  Habit? get habit;
}

class _UpsertHabitDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<UpsertHabitDefaultController,
        UpsertHabitModel> with UpsertHabitDefaultControllerRef {
  _UpsertHabitDefaultControllerProviderElement(super.provider);

  @override
  UpsertHabitNavigationService get upsertHabitNavigationService =>
      (origin as UpsertHabitDefaultControllerProvider)
          .upsertHabitNavigationService;
  @override
  HabitRepository get habitRepository =>
      (origin as UpsertHabitDefaultControllerProvider).habitRepository;
  @override
  Habit? get habit => (origin as UpsertHabitDefaultControllerProvider).habit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
