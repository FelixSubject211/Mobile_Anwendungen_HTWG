// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_habits_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listHabitsDefaultControllerHash() =>
    r'e83ed97aeabc160d271001fe960583deb21e6961';

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

abstract class _$ListHabitsDefaultController
    extends BuildlessAutoDisposeNotifier<ListHabitsModel> {
  late final HabitRepository habitRepository;

  ListHabitsModel build({
    required HabitRepository habitRepository,
  });
}

/// See also [ListHabitsDefaultController].
@ProviderFor(ListHabitsDefaultController)
const listHabitsDefaultControllerProvider = ListHabitsDefaultControllerFamily();

/// See also [ListHabitsDefaultController].
class ListHabitsDefaultControllerFamily extends Family<ListHabitsModel> {
  /// See also [ListHabitsDefaultController].
  const ListHabitsDefaultControllerFamily();

  /// See also [ListHabitsDefaultController].
  ListHabitsDefaultControllerProvider call({
    required HabitRepository habitRepository,
  }) {
    return ListHabitsDefaultControllerProvider(
      habitRepository: habitRepository,
    );
  }

  @override
  ListHabitsDefaultControllerProvider getProviderOverride(
    covariant ListHabitsDefaultControllerProvider provider,
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
  String? get name => r'listHabitsDefaultControllerProvider';
}

/// See also [ListHabitsDefaultController].
class ListHabitsDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<ListHabitsDefaultController,
        ListHabitsModel> {
  /// See also [ListHabitsDefaultController].
  ListHabitsDefaultControllerProvider({
    required HabitRepository habitRepository,
  }) : this._internal(
          () =>
              ListHabitsDefaultController()..habitRepository = habitRepository,
          from: listHabitsDefaultControllerProvider,
          name: r'listHabitsDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listHabitsDefaultControllerHash,
          dependencies: ListHabitsDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              ListHabitsDefaultControllerFamily._allTransitiveDependencies,
          habitRepository: habitRepository,
        );

  ListHabitsDefaultControllerProvider._internal(
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
  ListHabitsModel runNotifierBuild(
    covariant ListHabitsDefaultController notifier,
  ) {
    return notifier.build(
      habitRepository: habitRepository,
    );
  }

  @override
  Override overrideWith(ListHabitsDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListHabitsDefaultControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<ListHabitsDefaultController,
      ListHabitsModel> createElement() {
    return _ListHabitsDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListHabitsDefaultControllerProvider &&
        other.habitRepository == habitRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListHabitsDefaultControllerRef
    on AutoDisposeNotifierProviderRef<ListHabitsModel> {
  /// The parameter `habitRepository` of this provider.
  HabitRepository get habitRepository;
}

class _ListHabitsDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ListHabitsDefaultController,
        ListHabitsModel> with ListHabitsDefaultControllerRef {
  _ListHabitsDefaultControllerProviderElement(super.provider);

  @override
  HabitRepository get habitRepository =>
      (origin as ListHabitsDefaultControllerProvider).habitRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member