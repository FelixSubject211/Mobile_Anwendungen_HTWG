// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_statistics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingStatisticsDefaultControllerHash() =>
    r'c4f46c1c6644c0ecc3fd441032e9a332074598af';

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
  late final OnboardingRepository onboardingRepository;

  OnboardingStatisticsDefaultController? build({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingRepository onboardingRepository,
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
    required OnboardingRepository onboardingRepository,
  }) {
    return OnboardingStatisticsDefaultControllerProvider(
      onboardingNavigationService: onboardingNavigationService,
      onboardingRepository: onboardingRepository,
    );
  }

  @override
  OnboardingStatisticsDefaultControllerProvider getProviderOverride(
    covariant OnboardingStatisticsDefaultControllerProvider provider,
  ) {
    return call(
      onboardingNavigationService: provider.onboardingNavigationService,
      onboardingRepository: provider.onboardingRepository,
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
    required OnboardingRepository onboardingRepository,
  }) : this._internal(
          () => OnboardingStatisticsDefaultController()
            ..onboardingNavigationService = onboardingNavigationService
            ..onboardingRepository = onboardingRepository,
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
          onboardingRepository: onboardingRepository,
        );

  OnboardingStatisticsDefaultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onboardingNavigationService,
    required this.onboardingRepository,
  }) : super.internal();

  final OnboardingNavigationService onboardingNavigationService;
  final OnboardingRepository onboardingRepository;

  @override
  OnboardingStatisticsDefaultController? runNotifierBuild(
    covariant OnboardingStatisticsDefaultController notifier,
  ) {
    return notifier.build(
      onboardingNavigationService: onboardingNavigationService,
      onboardingRepository: onboardingRepository,
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
          ..onboardingRepository = onboardingRepository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onboardingNavigationService: onboardingNavigationService,
        onboardingRepository: onboardingRepository,
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
        other.onboardingRepository == onboardingRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onboardingNavigationService.hashCode);
    hash = _SystemHash.combine(hash, onboardingRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnboardingStatisticsDefaultControllerRef
    on AutoDisposeNotifierProviderRef<OnboardingStatisticsDefaultController?> {
  /// The parameter `onboardingNavigationService` of this provider.
  OnboardingNavigationService get onboardingNavigationService;

  /// The parameter `onboardingRepository` of this provider.
  OnboardingRepository get onboardingRepository;
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
  OnboardingRepository get onboardingRepository =>
      (origin as OnboardingStatisticsDefaultControllerProvider)
          .onboardingRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
