// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_start_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingStartDefaultControllerHash() =>
    r'236812d2e4df8b602292b6988eb121d66f58d5ab';

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

abstract class _$OnboardingStartDefaultController
    extends BuildlessAutoDisposeNotifier<OnboardingStartDefaultController?> {
  late final OnboardingNavigationService onboardingNavigationService;
  late final OnboardingService onboardingService;

  OnboardingStartDefaultController? build({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingService onboardingService,
  });
}

/// See also [OnboardingStartDefaultController].
@ProviderFor(OnboardingStartDefaultController)
const onboardingStartDefaultControllerProvider =
    OnboardingStartDefaultControllerFamily();

/// See also [OnboardingStartDefaultController].
class OnboardingStartDefaultControllerFamily
    extends Family<OnboardingStartDefaultController?> {
  /// See also [OnboardingStartDefaultController].
  const OnboardingStartDefaultControllerFamily();

  /// See also [OnboardingStartDefaultController].
  OnboardingStartDefaultControllerProvider call({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingService onboardingService,
  }) {
    return OnboardingStartDefaultControllerProvider(
      onboardingNavigationService: onboardingNavigationService,
      onboardingService: onboardingService,
    );
  }

  @override
  OnboardingStartDefaultControllerProvider getProviderOverride(
    covariant OnboardingStartDefaultControllerProvider provider,
  ) {
    return call(
      onboardingNavigationService: provider.onboardingNavigationService,
      onboardingService: provider.onboardingService,
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
  String? get name => r'onboardingStartDefaultControllerProvider';
}

/// See also [OnboardingStartDefaultController].
class OnboardingStartDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<OnboardingStartDefaultController,
        OnboardingStartDefaultController?> {
  /// See also [OnboardingStartDefaultController].
  OnboardingStartDefaultControllerProvider({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingService onboardingService,
  }) : this._internal(
          () => OnboardingStartDefaultController()
            ..onboardingNavigationService = onboardingNavigationService
            ..onboardingService = onboardingService,
          from: onboardingStartDefaultControllerProvider,
          name: r'onboardingStartDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onboardingStartDefaultControllerHash,
          dependencies: OnboardingStartDefaultControllerFamily._dependencies,
          allTransitiveDependencies:
              OnboardingStartDefaultControllerFamily._allTransitiveDependencies,
          onboardingNavigationService: onboardingNavigationService,
          onboardingService: onboardingService,
        );

  OnboardingStartDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onboardingNavigationService,
    required this.onboardingService,
  }) : super.internal();

  final OnboardingNavigationService onboardingNavigationService;
  final OnboardingService onboardingService;

  @override
  OnboardingStartDefaultController? runNotifierBuild(
    covariant OnboardingStartDefaultController notifier,
  ) {
    return notifier.build(
      onboardingNavigationService: onboardingNavigationService,
      onboardingService: onboardingService,
    );
  }

  @override
  Override overrideWith(OnboardingStartDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingStartDefaultControllerProvider._internal(
        () => create()
          ..onboardingNavigationService = onboardingNavigationService
          ..onboardingService = onboardingService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onboardingNavigationService: onboardingNavigationService,
        onboardingService: onboardingService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OnboardingStartDefaultController,
      OnboardingStartDefaultController?> createElement() {
    return _OnboardingStartDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingStartDefaultControllerProvider &&
        other.onboardingNavigationService == onboardingNavigationService &&
        other.onboardingService == onboardingService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onboardingNavigationService.hashCode);
    hash = _SystemHash.combine(hash, onboardingService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnboardingStartDefaultControllerRef
    on AutoDisposeNotifierProviderRef<OnboardingStartDefaultController?> {
  /// The parameter `onboardingNavigationService` of this provider.
  OnboardingNavigationService get onboardingNavigationService;

  /// The parameter `onboardingService` of this provider.
  OnboardingService get onboardingService;
}

class _OnboardingStartDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<OnboardingStartDefaultController,
        OnboardingStartDefaultController?>
    with OnboardingStartDefaultControllerRef {
  _OnboardingStartDefaultControllerProviderElement(super.provider);

  @override
  OnboardingNavigationService get onboardingNavigationService =>
      (origin as OnboardingStartDefaultControllerProvider)
          .onboardingNavigationService;
  @override
  OnboardingService get onboardingService =>
      (origin as OnboardingStartDefaultControllerProvider).onboardingService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
