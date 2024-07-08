// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_habits_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingHabitsDefaultControllerHash() =>
    r'66552449263b3dd0e72046dc245e83bf2c1de0bf';

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

abstract class _$OnboardingHabitsDefaultController
    extends BuildlessAutoDisposeNotifier<OnboardingHabitsDefaultController?> {
  late final OnboardingNavigationService onboardingNavigationService;

  OnboardingHabitsDefaultController? build({
    required OnboardingNavigationService onboardingNavigationService,
  });
}

/// See also [OnboardingHabitsDefaultController].
@ProviderFor(OnboardingHabitsDefaultController)
const onboardingHabitsDefaultControllerProvider =
    OnboardingHabitsDefaultControllerFamily();

/// See also [OnboardingHabitsDefaultController].
class OnboardingHabitsDefaultControllerFamily
    extends Family<OnboardingHabitsDefaultController?> {
  /// See also [OnboardingHabitsDefaultController].
  const OnboardingHabitsDefaultControllerFamily();

  /// See also [OnboardingHabitsDefaultController].
  OnboardingHabitsDefaultControllerProvider call({
    required OnboardingNavigationService onboardingNavigationService,
  }) {
    return OnboardingHabitsDefaultControllerProvider(
      onboardingNavigationService: onboardingNavigationService,
    );
  }

  @override
  OnboardingHabitsDefaultControllerProvider getProviderOverride(
    covariant OnboardingHabitsDefaultControllerProvider provider,
  ) {
    return call(
      onboardingNavigationService: provider.onboardingNavigationService,
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
  String? get name => r'onboardingHabitsDefaultControllerProvider';
}

/// See also [OnboardingHabitsDefaultController].
class OnboardingHabitsDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<OnboardingHabitsDefaultController,
        OnboardingHabitsDefaultController?> {
  /// See also [OnboardingHabitsDefaultController].
  OnboardingHabitsDefaultControllerProvider({
    required OnboardingNavigationService onboardingNavigationService,
  }) : this._internal(
          () => OnboardingHabitsDefaultController()
            ..onboardingNavigationService = onboardingNavigationService,
          from: onboardingHabitsDefaultControllerProvider,
          name: r'onboardingHabitsDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onboardingHabitsDefaultControllerHash,
          dependencies: OnboardingHabitsDefaultControllerFamily._dependencies,
          allTransitiveDependencies: OnboardingHabitsDefaultControllerFamily
              ._allTransitiveDependencies,
          onboardingNavigationService: onboardingNavigationService,
        );

  OnboardingHabitsDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onboardingNavigationService,
  }) : super.internal();

  final OnboardingNavigationService onboardingNavigationService;

  @override
  OnboardingHabitsDefaultController? runNotifierBuild(
    covariant OnboardingHabitsDefaultController notifier,
  ) {
    return notifier.build(
      onboardingNavigationService: onboardingNavigationService,
    );
  }

  @override
  Override overrideWith(OnboardingHabitsDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingHabitsDefaultControllerProvider._internal(
        () =>
            create()..onboardingNavigationService = onboardingNavigationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onboardingNavigationService: onboardingNavigationService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OnboardingHabitsDefaultController,
      OnboardingHabitsDefaultController?> createElement() {
    return _OnboardingHabitsDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingHabitsDefaultControllerProvider &&
        other.onboardingNavigationService == onboardingNavigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onboardingNavigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnboardingHabitsDefaultControllerRef
    on AutoDisposeNotifierProviderRef<OnboardingHabitsDefaultController?> {
  /// The parameter `onboardingNavigationService` of this provider.
  OnboardingNavigationService get onboardingNavigationService;
}

class _OnboardingHabitsDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<
        OnboardingHabitsDefaultController, OnboardingHabitsDefaultController?>
    with OnboardingHabitsDefaultControllerRef {
  _OnboardingHabitsDefaultControllerProviderElement(super.provider);

  @override
  OnboardingNavigationService get onboardingNavigationService =>
      (origin as OnboardingHabitsDefaultControllerProvider)
          .onboardingNavigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
