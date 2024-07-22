// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_statistics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingStatisticsDefaultControllerHash() =>
    r'10f5d6dfc4c182eda1e3945fb1846afb425b48c3';

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

abstract class _$OnboardingStatisticsDefaultController
    extends BuildlessAutoDisposeNotifier<
        OnboardingStatisticsDefaultController?> {
  late final OnboardingNavigationService onboardingNavigationService;
  late final OnboardingService onboardingService;

  OnboardingStatisticsDefaultController? build({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingService onboardingService,
  });
}

/// See also [OnboardingStatisticsDefaultController].
@ProviderFor(OnboardingStatisticsDefaultController)
const onboardingStatisticsDefaultControllerProvider =
    OnboardingStatisticsDefaultControllerFamily();

/// See also [OnboardingStatisticsDefaultController].
class OnboardingStatisticsDefaultControllerFamily
    extends Family<OnboardingStatisticsDefaultController?> {
  /// See also [OnboardingStatisticsDefaultController].
  const OnboardingStatisticsDefaultControllerFamily();

  /// See also [OnboardingStatisticsDefaultController].
  OnboardingStatisticsDefaultControllerProvider call({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingService onboardingService,
  }) {
    return OnboardingStatisticsDefaultControllerProvider(
      onboardingNavigationService: onboardingNavigationService,
      onboardingService: onboardingService,
    );
  }

  @override
  OnboardingStatisticsDefaultControllerProvider getProviderOverride(
    covariant OnboardingStatisticsDefaultControllerProvider provider,
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
  String? get name => r'onboardingStatisticsDefaultControllerProvider';
}

/// See also [OnboardingStatisticsDefaultController].
class OnboardingStatisticsDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<
        OnboardingStatisticsDefaultController,
        OnboardingStatisticsDefaultController?> {
  /// See also [OnboardingStatisticsDefaultController].
  OnboardingStatisticsDefaultControllerProvider({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingService onboardingService,
  }) : this._internal(
          () => OnboardingStatisticsDefaultController()
            ..onboardingNavigationService = onboardingNavigationService
            ..onboardingService = onboardingService,
          from: onboardingStatisticsDefaultControllerProvider,
          name: r'onboardingStatisticsDefaultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onboardingStatisticsDefaultControllerHash,
          dependencies:
              OnboardingStatisticsDefaultControllerFamily._dependencies,
          allTransitiveDependencies: OnboardingStatisticsDefaultControllerFamily
              ._allTransitiveDependencies,
          onboardingNavigationService: onboardingNavigationService,
          onboardingService: onboardingService,
        );

  OnboardingStatisticsDefaultControllerProvider._internal(
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
  OnboardingStatisticsDefaultController? runNotifierBuild(
    covariant OnboardingStatisticsDefaultController notifier,
  ) {
    return notifier.build(
      onboardingNavigationService: onboardingNavigationService,
      onboardingService: onboardingService,
    );
  }

  @override
  Override overrideWith(
      OnboardingStatisticsDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingStatisticsDefaultControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<OnboardingStatisticsDefaultController,
      OnboardingStatisticsDefaultController?> createElement() {
    return _OnboardingStatisticsDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingStatisticsDefaultControllerProvider &&
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

mixin OnboardingStatisticsDefaultControllerRef
    on AutoDisposeNotifierProviderRef<OnboardingStatisticsDefaultController?> {
  /// The parameter `onboardingNavigationService` of this provider.
  OnboardingNavigationService get onboardingNavigationService;

  /// The parameter `onboardingService` of this provider.
  OnboardingService get onboardingService;
}

class _OnboardingStatisticsDefaultControllerProviderElement
    extends AutoDisposeNotifierProviderElement<
        OnboardingStatisticsDefaultController,
        OnboardingStatisticsDefaultController?>
    with OnboardingStatisticsDefaultControllerRef {
  _OnboardingStatisticsDefaultControllerProviderElement(super.provider);

  @override
  OnboardingNavigationService get onboardingNavigationService =>
      (origin as OnboardingStatisticsDefaultControllerProvider)
          .onboardingNavigationService;
  @override
  OnboardingService get onboardingService =>
      (origin as OnboardingStatisticsDefaultControllerProvider)
          .onboardingService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
