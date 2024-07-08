// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_start_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingStartDefaultControllerHash() =>
    r'38a2d4fd968ecc5c25334f4a4de9fc084ca434a0';

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
  late final OnboardingRepository onboardingRepository;

  OnboardingStartDefaultController? build({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingRepository onboardingRepository,
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
    required OnboardingRepository onboardingRepository,
  }) {
    return OnboardingStartDefaultControllerProvider(
      onboardingNavigationService: onboardingNavigationService,
      onboardingRepository: onboardingRepository,
    );
  }

  @override
  OnboardingStartDefaultControllerProvider getProviderOverride(
    covariant OnboardingStartDefaultControllerProvider provider,
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
  String? get name => r'onboardingStartDefaultControllerProvider';
}

/// See also [OnboardingStartDefaultController].
class OnboardingStartDefaultControllerProvider
    extends AutoDisposeNotifierProviderImpl<OnboardingStartDefaultController,
        OnboardingStartDefaultController?> {
  /// See also [OnboardingStartDefaultController].
  OnboardingStartDefaultControllerProvider({
    required OnboardingNavigationService onboardingNavigationService,
    required OnboardingRepository onboardingRepository,
  }) : this._internal(
          () => OnboardingStartDefaultController()
            ..onboardingNavigationService = onboardingNavigationService
            ..onboardingRepository = onboardingRepository,
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
          onboardingRepository: onboardingRepository,
        );

  OnboardingStartDefaultControllerProvider._internal(
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
  OnboardingStartDefaultController? runNotifierBuild(
    covariant OnboardingStartDefaultController notifier,
  ) {
    return notifier.build(
      onboardingNavigationService: onboardingNavigationService,
      onboardingRepository: onboardingRepository,
    );
  }

  @override
  Override overrideWith(OnboardingStartDefaultController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingStartDefaultControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<OnboardingStartDefaultController,
      OnboardingStartDefaultController?> createElement() {
    return _OnboardingStartDefaultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingStartDefaultControllerProvider &&
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

mixin OnboardingStartDefaultControllerRef
    on AutoDisposeNotifierProviderRef<OnboardingStartDefaultController?> {
  /// The parameter `onboardingNavigationService` of this provider.
  OnboardingNavigationService get onboardingNavigationService;

  /// The parameter `onboardingRepository` of this provider.
  OnboardingRepository get onboardingRepository;
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
  OnboardingRepository get onboardingRepository =>
      (origin as OnboardingStartDefaultControllerProvider).onboardingRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
